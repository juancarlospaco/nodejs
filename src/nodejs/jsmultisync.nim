import std/[macros, strutils]

proc replaceReturn(node: NimNode) =
  var z = 0
  for s in node:
    var son = node[z]
    let jsResolve = ident("jsResolve")
    if son.kind == nnkReturnStmt:
      let value = if son[0].kind != nnkEmpty: newCall("jsResolve", son[0]) else: jsResolve
      node[z] = nnkReturnStmt.newTree(value)
    elif son.kind == nnkAsgn and son[0].kind == nnkIdent and $son[0] == "result":
      node[z] = nnkAsgn.newTree(son[0], newCall("jsResolve", son[1]))
    else:
      replaceReturn(son)
    inc z

proc isFutureVoid(node: NimNode): bool =
  result = node.kind == nnkBracketExpr and
          node[0].kind == nnkIdent and $node[0] == "Future" and
          node[1].kind == nnkIdent and $node[1] == "void"

proc generateJsasync(arg: NimNode): NimNode =
  if arg.kind notin {nnkProcDef, nnkLambda, nnkMethodDef, nnkDo}:
      error("Cannot transform this node kind into an async proc." &
            " proc/method definition or lambda node expected.", arg)

  result = arg
  var isVoid = false
  let jsResolve = ident("jsResolve")
  if arg.params[0].kind == nnkEmpty:
    result.params[0] = nnkBracketExpr.newTree(ident("Future"), ident("void"))
    isVoid = true
  elif isFutureVoid(arg.params[0]):
    isVoid = true

  var code = result.body
  replaceReturn(code)
  result.body = nnkStmtList.newTree()

  if len(code) > 0:
    var awaitFunction = quote:
      proc await[T](f: Future[T]): T {.importjs: "(await #)", used.}
    result.body.add(awaitFunction)

    var resolve: NimNode
    if isVoid:
      resolve = quote:
        var `jsResolve` {.importjs: "undefined".}: Future[void]
    else:
      resolve = quote:
        proc jsResolve[T](a: T): Future[T] {.importjs: "#", used.}
        proc jsResolve[T](a: Future[T]): Future[T] {.importjs: "#", used.}
    result.body.add(resolve)
  else:
    result.body = newEmptyNode()
  for child in code:
    result.body.add(child)

  if len(code) > 0 and isVoid:
    var voidFix = quote:
      return `jsResolve`
    result.body.add(voidFix)

  let asyncPragma = quote:
    {.codegenDecl: "async function $2($3)".}

  result.addPragma(asyncPragma[0])


proc isInvalidReturnType(typeName: string): bool =
  return typeName notin ["Future"]

proc verifyReturnType(typeName: string, node: NimNode = nil) =
  if typeName.isInvalidReturnType:
    error("Expected return type of 'Future' got '$1'" %
          typeName, node)

proc splitParamType(paramType: NimNode, async: bool): NimNode =
  result = paramType
  if paramType.kind == nnkInfix and paramType[0].strVal in ["|", "or"]:
    let firstAsync = "async" in paramType[1].strVal.normalize
    let secondAsync = "async" in paramType[2].strVal.normalize

    if firstAsync:
      result = paramType[if async: 1 else: 2]
    elif secondAsync:
      result = paramType[if async: 2 else: 1]

proc stripReturnType(returnType: NimNode): NimNode =
  # Strip out the 'Future' from 'Future[T]'.
  result = returnType
  if returnType.kind == nnkBracketExpr:
    let fut = repr(returnType[0])
    verifyReturnType(fut, returnType)
    result = returnType[1]

proc generateJssync(prc: NimNode): NimNode =
  ## Takes a procedure definition which takes a generic union of arguments,
  ## for example: proc (socket: Socket | AsyncSocket).
  ## It transforms them so that `proc (socket: Socket)` and
  ## `proc (socket: AsyncSocket)` are returned.

  result = prc.copyNimTree()
  # Retrieve the `T` inside `Future[T]`.
  let returnType = stripReturnType(result[3][0])
  result[3][0] = splitParamType(returnType, async = false)
  for i in 1 ..< result[3].len:
    # FormalParams (3) -> IdentDefs, the parameter (i) ->
    # parameter type (1).
    result[3][i][1] = splitParamType(result[3][i][1], async=false)
  var multisyncAwait = quote:
    template await(value: typed): untyped =
      value

  result[^1] = nnkStmtList.newTree(multisyncAwait, result[^1])

macro multisync*(prc: untyped): untyped =
  result = newStmtList()
  result.add generateJssync(prc)
  result.add generateJsasync(prc)
