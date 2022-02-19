import std/macros


macro unrollIt*(x: ForLoopStmt) =
  ## Compile-time macro-unrolled zero-overhead `for` loops.
  ##
  ## .. code-block:: nim
  ##   for _ in unrollIt([0, 1, 2, 3]): echo it
  ##
  ## Expands to:
  ##
  ## .. code-block:: nim
  ##   block:
  ##     var it = 0
  ##     echo it
  ##     it = 1
  ##     echo it
  ##     it = 2
  ##     echo it
  ##     it = 3
  ##     echo it
  ##
  ## Another example:
  ##
  ## .. code-block:: nim
  ##   for _ in unrollIt([('a', true), ('b', false)]): echo it
  ##
  ## Expands to:
  ##
  ## .. code-block:: nim
  ##   block:
  ##     var it = ('a', true)
  ##     echo it
  ##     it = ('b', false)
  ##     echo it
  ##
  ## You must use `_` as argument, because it must be ignored, this is invalid:
  ##
  ## .. code-block:: nim
  ##   for i in unrollIt([0, 1]): echo it  # Uses "for i in" instead of "for _ in"
  ##
  ## Iterable must not be empty, because theres nothing to unroll, these are Invalid:
  ##
  ## .. code-block:: nim
  ##   for _ in unrollIt([]):   echo it  # Can not unroll emptyness into nothing.
  ##   for _ in unrollIt([42]): echo it  # Pointless to unroll just 1 item.
  ##
  ## Inside the unrolled body you can use the variable `it`,
  ## only the `it` variable is allocated by the macro for minimal overhead,
  ## this does not mutate nor copy the iterable,
  ## the items inside the iterable must be assignable to a `var`.
  ## Inspired by `sequtils.mapIt`. Iterable must not be empty.
  expectKind x, nnkForStmt
  doAssert x[0].strVal == "_", "Wrong argument, use '_' instead of '" & x[0].strVal & "'"
  doAssert x[^2][^1].len > 1, "Iterable must not be empty, because theres nothing to unroll"
  var body = newStmtList()
  var itDeclared = false
  for i in 0 ..< x[^2][^1].len:
    if itDeclared:
      if x[^2][^1].len > i:
        body.add nnkAsgn.newTree(newIdentNode("it"), x[^2][^1][i])
    else:
      body.add newVarStmt(newIdentNode("it"), x[^2][^1][0])
      itDeclared = true
    body.add x[^1]
  result = newBlockStmt(body)


macro unrollStringOps*(x: ForLoopStmt) =
  ## Compile-time macro-unrolled zero-overhead String operations.
  ## Unroll any `string` ops into `char` ops, does NOT create a `block:`,
  ## works better with `newStringOfCap`.
  ##
  ## .. code-block:: nim
  ##   var it: char        # Required, must be type char, must be mutable.
  ##   var output: string  # Use newStringOfCap() for even more performance.
  ##   for _ in unrollStringOps("abc", it): output.add it  # Ops to unroll here.
  ##
  ## Expands to:
  ##
  ## .. code-block:: nim
  ##   var it: char
  ##   var output: string
  ##   it = 'a'
  ##   add(output, it)
  ##   it = 'b'
  ##   add(output, it)
  ##   it = 'c'
  ##
  ## String to unroll must not be empty, these are invalid:
  ##
  ## .. code-block:: nim
  ##   var it: char
  ##   var output: string
  ##   for _ in unrollStringOps("", it): output.add it
  ##   for _ in unrollStringOps("a", it): output.add it
  expectKind x, nnkForStmt
  expectKind x[^2][^1], {nnkIdent}
  expectKind x[^2][^2], {nnkStrLit, nnkRStrLit, nnkTripleStrLit}
  doAssert x[0].strVal == "_", "Wrong argument, use '_' instead of '" & x[0].strVal & "'"
  doAssert x[^2][^2].strVal.len > 1, "Iterable must not be empty, because theres nothing to unroll"
  var body = newStmtList()
  for chara in x[^2][^2].strVal:
    body.add nnkAsgn.newTree(x[^2][^1], chara.newLit)
    body.add x[^1]
  # body.add nnkAsgn.newTree(x[^2][^1], newLit('\0'))
  result = body


macro unrollEncodeQuery*(target: var string; args: openArray[(string, string)]) =
  ## Compile-time macro-unrolled zero-overhead `uri.encodeQuery`. Works better with `newStringOfCap`.
  ##
  ## .. warning:: Values must be Non-empty URL-encoded strings, this does NOT call `uri.encodeUrl`.
  runnableExamples:
    const x = "cat"
    const y = "dog"
    const z = "42"
    var queryParams = ""
    unrollEncodeQuery(queryParams, {"key0": x, "key1": y, "key2": z})
    doAssert queryParams == "?key0=cat&key1=dog&key2=42"
  ## Expands to:
  ##
  ## .. code-block:: nim
  ##   var queryParams = ""
  ##   queryParams.add '?'
  ##   queryParams.add, 'k'
  ##   queryParams.add, 'e'
  ##   queryParams.add, 'y'
  ##   queryParams.add, '0'
  ##   queryParams.add, '='
  ##   queryParams.add, x
  ##   queryParams.add '&'
  ##   queryParams.add 'k'
  ##   queryParams.add 'e'
  ##   queryParams.add 'y'
  ##   queryParams.add '1'
  ##   queryParams.add '='
  ##   queryParams.add y
  ##   queryParams.add '&'
  ##   queryParams.add 'k'
  ##   queryParams.add 'e'
  ##   queryParams.add 'y'
  ##   queryParams.add '2'
  ##   queryParams.add '='
  ##   queryParams.add z
  doAssert args.len > 1, "Iterable must not be empty, because theres nothing to unroll"
  result = newStmtList()
  for i, item in args:
    let key: string = item[1][0].strVal
    doAssert key.len > 0, "Key must not be empty string."
    result.add nnkCall.newTree(nnkDotExpr.newTree(target, newIdentNode"add"), newLit(if i == 0: '?' else: '&'))
    for c in key: result.add nnkCall.newTree(nnkDotExpr.newTree(target, newIdentNode"add"), c.newLit)
    result.add nnkCall.newTree(nnkDotExpr.newTree(target, newIdentNode"add"), newLit('='))
    result.add nnkCall.newTree(nnkDotExpr.newTree(target, newIdentNode"add"), item[1][1])
