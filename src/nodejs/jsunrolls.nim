import macros

macro unrollIt*(x: ForLoopStmt) =
  ## Compile-time macro-unrolled zero-overhead `for` loops.
  ##
  ## .. code-block:: nim
  ##   for i in unrollIt([0, 1, 2, 3]): echo it
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
  ##   for i in unrollIt([('a', true), ('b', false)]): echo it
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
  ## Inside the unrolled body you can use the variable `it`,
  ## only the `it` variable is allocated by the macro for minimal overhead,
  ## this does not mutate nor copy the iterable,
  ## the items inside the iterable must be assignable to a `var`.
  ## Inspired by `sequtils.mapIt`.
  expectKind x, nnkForStmt
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
