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


macro unrollEncodeQuery*(target: var string; args: openArray[(string, auto)]; escape: typed = nil; quote: static[bool] = false) =
  ## Compile-time macro-unrolled zero-overhead `uri.encodeQuery`.
  ## * If `quote` is `true`, then the query string Values will be quoted, even if it is not required.
  ## * If values are integers `nnkIntLit..nnkUInt64Lit` then `addInt` is used for performance, otherwise `add`.
  ## * `target` can be empty string, `args` must not be empty, `escape` can be `nil`.
  ## * If `escape` is not `nil`, then the query string values will be URL-encoded using `escape()` function.
  ## * Some examples of `escape` can be `encodeUrl`, `strip`, `toLowerAscii`, `toUpperAscii`, etc.
  ## * Works better with `newStringOfCap(cap = yourBestGuess)`.
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
  ##   queryParams.add 'k'
  ##   queryParams.add 'e'
  ##   queryParams.add 'y'
  ##   queryParams.add '0'
  ##   queryParams.add '='
  ##   queryParams.add x
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
  ##
  ## To work with NON URL-encoded strings, use `escape=encodeUrl`:
  runnableExamples:
    from std/uri import encodeUrl # You must import your escaping function.
    var a = "\0"                  # This value is NOT URL Encoded.
    let b = "a b c"               # This value is NOT URL Encoded.
    const c = ""                  # This value is NOT URL Encoded.
    var queryParams = ""
    # Expands to `encodeUrl(a)`, `encodeUrl(b)`, `encodeUrl(c)`
    unrollEncodeQuery(queryParams, {"a": a, "b": b, "c": c}, escape = encodeUrl)
    doAssert queryParams == "?a=%00&b=a+b+c&c="  # This URL query param is URL Encoded.
  ## Working with float values, force quoting using `quote=true` and a `custom` func:
  runnableExamples:
    const foo = 3.14
    const bar = -9.9
    const baz = 0.0
    var queryParams = "https://Nim-lang.org"
    func custom(floaty: float): string = $floaty
    unrollEncodeQuery(queryParams, {"a": foo, "b": bar, "c": baz}, quote = true, escape = custom)
    doAssert queryParams == """https://Nim-lang.org?a="3.14"&b="-9.9"&c="0.0""""
  ## * If you still do not understand what you are doing, use `escape=encodeUrl` and `import std/uri`.
  doAssert args.len > 0, "Iterable must not be empty, because theres nothing to unroll"
  result = newStmtList()
  for i, item in args:
    let key: string = item[1][0].strVal
    doAssert key.len > 0, "Key must not be empty string."
    result.add nnkCall.newTree(nnkDotExpr.newTree(target, newIdentNode"add"), newLit(if i == 0: '?' else: '&'))
    for c in key: result.add nnkCall.newTree(nnkDotExpr.newTree(target, newIdentNode"add"), c.newLit)
    result.add nnkCall.newTree(nnkDotExpr.newTree(target, newIdentNode"add"), newLit('='))
    if quote: result.add nnkCall.newTree(nnkDotExpr.newTree(target, newIdentNode"add"), newLit('"'))
    result.add nnkCall.newTree(nnkDotExpr.newTree(target, newIdentNode"add"), if escape != nil: nnkCall.newTree(escape, item[1][1]) else: item[1][1])
    if quote: result.add nnkCall.newTree(nnkDotExpr.newTree(target, newIdentNode"add"), newLit('"'))


macro unrollEncodeQuery*(target: var string; args: openArray[(string, SomeInteger)]; escape: typed = nil; quote: static[bool] = false) =
  ## Same as `unrollEncodeQuery` but optimized for integers, uses `addInt` instead of `add`.
  runnableExamples:
    var integer = 42  # Run-time value.
    var queryParams = ""
    unrollEncodeQuery(queryParams, {"a": integer})
    doAssert queryParams == "?a=42"
  ## Expands to:
  ##
  ## .. code-block:: nim
  ##   var queryParams = ""
  ##   queryParams.add '?'
  ##   queryParams.add 'a'
  ##   queryParams.add '='
  ##   queryParams.addInt 42
  ##
  ## Automatically uses `addInt` for performance.
  doAssert args.len > 0, "Iterable must not be empty, because theres nothing to unroll"
  result = newStmtList()
  for i, item in args:
    let key: string = item[1][0].strVal
    doAssert key.len > 0, "Key must not be empty string."
    result.add nnkCall.newTree(nnkDotExpr.newTree(target, newIdentNode"add"), newLit(if i == 0: '?' else: '&'))
    for c in key: result.add nnkCall.newTree(nnkDotExpr.newTree(target, newIdentNode"add"), c.newLit)
    result.add nnkCall.newTree(nnkDotExpr.newTree(target, newIdentNode"add"), newLit('='))
    if quote: result.add nnkCall.newTree(nnkDotExpr.newTree(target, newIdentNode"add"), newLit('"'))
    result.add nnkCall.newTree(nnkDotExpr.newTree(target, newIdentNode"addInt"), if escape != nil: nnkCall.newTree(escape, item[1][1]) else: item[1][1])
    if quote: result.add nnkCall.newTree(nnkDotExpr.newTree(target, newIdentNode"add"), newLit('"'))
