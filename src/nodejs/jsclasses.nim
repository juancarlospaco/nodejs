## * JavaScript Classes with methods, getters, exports, and private/public/static for Nim.
## * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes
when not defined(js):
  {.fatal: "JavaScript Classes is designed to be used with JavaScript targets.".}

import std/[macros, strutils, sequtils, sugar]

template isType(typeName: string; i: int; params: seq[string]): bool =
  ## Check if next is a Type.
  params.len > i + 1 and params[i + 1] == typeName

template staticer(s: var string) =
  ## Handle the "static" JavaScript annotation.
  if s[^1] == '*': s.setLen(s.len - 1) else: s = '#' & s

template asterisker(s: var string) =
  ## Handle Nim asterisk export mark.
  ## * Nim: `foo*` is Public,  `foo` is Private, staticFoo()
  ## * JS:  `#foo` is Private, `foo` is Public,  static foo()
  if s.startsWith"static":
    s.removePrefix("static")  #  staticFoo()
    s.removePrefix '_'        #  static_foo()
    staticer(s)
    s = "static " & s         #  static foo()
  else: staticer(s)           #  #foo()

proc genParams(n: NimNode; typeName: string): string =
  ## Function params.
  for param in n.params:
    if param.len > 0:
      var iterableParams = toSeq(param.items).filter((p: NimNode) => p.kind != nnkEmpty).map((p: NimNode) => $p)
      for i, p in iterableParams.mpairs:
        removePrefix(p, "c")
        if p.len == 0 or isType(typeName, i, iterableParams): break
        elif parseEnum("nty" & capitalizeAscii(p), ntyNone) == ntyNone and p.len > 0:
          result.add p
          result.add ','
          result.add ' '
  result.removeSuffix(", ")

proc genJsBody(n: NimNode): string =
  ## Generate a function body.
  var maxlen = 1
  for i, bn in n.body:
    let lengt = len($toStrLit(bn))
    if lengt > 79:
      maxlen = 80
      break
    if lengt > maxlen: maxlen = lengt
  for i, bn in n.body:
    if i > 0:
      result.add ';'
      result.add '\n'
    result.add alignLeft($toStrLit(bn), maxlen)  # $toStrLit(bn) & spaces(80 - n.body.len)
    if (i + 1) == n.body.len: result.add ';'
    # case bn.kind
    # of nnkAsgn, nnkReturnStmt: result.add $toStrLit(bn) & ';'
    # else: discard

proc genNimType(typeName, baseName: string; isExported: bool; fields: NimNode): NimNode =
  ## Generate a Nim type.
  result = newTree(nnkStmtList)
  var fieldsNode = newTree(nnkRecList)
  for field in toSeq(fields.items).filter((p: NimNode) => p.kind != nnkEmpty):
    fieldsNode.add(field)
  result.add(
    nnkTypeSection.newTree(
      nnkTypeDef.newTree(
        nnkPragmaExpr.newTree(
          if isExported: nnkPostfix.newTree(newIdentNode("*"), newIdentNode(typeName))
          else:          newIdentNode(typeName)
          ,
          nnkPragma.newTree(
            newIdentNode("importjs"),
            newIdentNode("nodecl"),
            newIdentNode("final"),
            newIdentNode("used"),
          )
        ),
        newEmptyNode(),
        nnkRefTy.newTree(
          nnkObjectTy.newTree(newEmptyNode(), nnkOfInherit.newTree(newIdentNode(baseName)), fieldsNode)
        )
      )
    )
  )

proc genNimNewProc(typeName: string; params: NimNode; isExported: bool): NimNode =
  ## Generate a new Nim proc.
  result = newTree(nnkStmtList)
  var adjustedParams = params
  adjustedParams[0] = newIdentNode(typeName)
  result.add(
    nnkProcDef.newTree(
      newIdentNode("new" & typeName),
      newEmptyNode(),
      newEmptyNode(),
      # if isExported: newIdentNode("*") else: newEmptyNode(),
      adjustedParams,
      nnkPragma.newTree(
        newIdentNode("used"),
        nnkExprColonExpr.newTree(newIdentNode("importjs"), newLit("(new " & typeName & "(@))"))
      ),
      newEmptyNode(),
      newEmptyNode()
    )
  )

proc genJsConstructor(n: NimNode; typeName: string; result: var string) =
  ## Generate a new JavaScript Constructor.
  result.add """
  /** $3 Constructor (line $4, column $5). */
  constructor($1) {
$2
  };

""" % [genParams(n, typeName), indent(genJsBody(n), 4), typeName, $lineInfoObj(n).line, $lineInfoObj(n).column]

proc genNimGetter(n: NimNode; typeName: string): NimNode =
  ## Generate a new Nim proc (Nim wont really uses Getter naming).
  result = newTree(nnkStmtList)
  var
    strippedName = toLowerAscii($n[0])
    adjustedParams = n.params
  adjustedParams.add(
    nnkIdentDefs.newTree(newIdentNode(toLowerAscii($typeName[0])), newIdentNode(typeName), newEmptyNode())
  )
  strippedName.removePrefix "get"
  strippedName.removePrefix '_'
  strippedName.removeSuffix '*'
  result.add(
    nnkProcDef.newTree(
      n[0],
      newEmptyNode(),
      newEmptyNode(),
      adjustedParams,
      nnkPragma.newTree(
        newIdentNode("used"),
        nnkExprColonExpr.newTree(
          newIdentNode("importjs"),
          newLit("#." & strippedName)
        )
      ),
      newEmptyNode(),
      newEmptyNode()
    )
  )

proc genJsGetter(n: NimNode; typeName: string; result: var string) =
  ## Generate a new JavaScript Getter.
  var t = toLowerAscii($n[0])
  t.removePrefix("get")  # getFoo()
  t.removePrefix '_'     # get_foo()
  asterisker(t)          # Public / Private
  result.add """
  /** $4.$1$2 Getter (line $5, column $6). */
  get $1$2() {
$3
  };

""" % [$t[0], t[1 ..< t.len], indent(genJsBody(n), 4), typeName, $lineInfoObj(n).line, $lineInfoObj(n).column]

proc genNimProc(n: NimNode; typeName: string): NimNode =
  ## Generate a new Nim proc.
  result = newTree(nnkStmtList)
  var adjustedParams = n.params
  adjustedParams.add(
    nnkIdentDefs.newTree(
      newIdentNode(toLowerAscii($typeName[0])),
      newIdentNode(typeName),
      newEmptyNode()
    )
  )
  var tempName = $n[0] #.strVal
  tempName.removePrefix "static"
  tempName.removePrefix '_'
  tempName.removeSuffix '*'
  result.add(
    nnkProcDef.newTree(
      n[0],
      newEmptyNode(),
      newEmptyNode(),
      adjustedParams,
      nnkPragma.newTree(
        newIdentNode("used"),
        nnkExprColonExpr.newTree(
          newIdentNode("importjs"),
          newLit("#." & tempName & "()")
        )
      ),
      newEmptyNode(),
      newEmptyNode()
    )
  )

proc genJsFunction(n: NimNode; typeName: string; result: var string) =
  ## Generate a new JavaScript function.
  var procName = $n[0]
  asterisker(procName)
  result.add """
  /** $4.$1 Method (line $5, column $6). */
  $1($2) {
$3
  };

""" % [procName, genParams(n, typeName), indent(genJsBody(n), 4), typeName, $lineInfoObj(n).line, $lineInfoObj(n).column]

macro class*(head, body: untyped) =
  ## .. Warning:: Inheritance and Generators not supported.
  var
    typeName, baseName: string
    isExported: bool
  if head.kind == nnkInfix and eqIdent(head[0], "of"):
    typeName = $head[1]
    baseName = $head[2]
  elif head.kind == nnkInfix and eqIdent(head[0], "*") and
    head[2].kind == nnkPrefix and eqIdent(head[2][0], "of"):
      typeName = $head[1]
      baseName = $head[2][1]
      isExported = true
  else:
    error "Invalid node: " & head.lispRepr
  result = newTree(nnkStmtList)
  var
    nimNodes: seq[NimNode] = @[]
    jsCodes = ""
  for n in body.children:
    case n.kind
    of nnkProcDef, nnkFuncDef:
      if $n[0] == "constructor" or $n[0] == "constructor*":
        nimNodes.add([
          genNimType(typeName, baseName, isExported, n.params),
          genNimNewProc(typeName, n.params, isExported)])
        jsCodes.add("""


/** $1 Class (line $2, column $3). */
class $1 {

""" % [typeName, $lineInfoObj(head).line, $lineInfoObj(head).column])
        genJsConstructor(n, typeName, jsCodes)
      elif startsWith($n[0], "get"):
        nimNodes.add(genNimGetter(n, typeName))
        genJsGetter(n, typeName, jsCodes)
      else:
        nimNodes.add(genNimProc(n, typeName))
        genJsFunction(n, typeName, jsCodes)
    else:
      assert false
  jsCodes.add(if isExported: "};\nexport { $1 };\n\n" % [typeName] else: "};\n\n")
  nimNodes.add(
    nnkPragma.newTree(
      nnkExprColonExpr.newTree(
        newIdentNode("emit"),
        newStrLitNode(jsCodes)
      )
    )
  )
  result.add(nimNodes)


when isMainModule:
  class Kitten* of JsRoot:

    proc constructor*(name: cstring; age: cint; food: float; sleeping: bool) =
      this.name = name
      this.age = age
      this.food = food
      this.sleeping = sleeping

    proc get_name*(): string =  # Or getArea()
      return this.name

    proc static_age*(): cint =  # Static method.
      return this.age

    proc calcAge*(): cint =
      return this.age + 1

    func goToSleep*() =
      this.sleeping = this.sleeping == true

    proc feed() =
      this.food = this.food + 1.0


  let cat = newKitten(name="Zoe", age=2, food=1.0, sleeping=false)
  discard cat.get_name()
  discard cat.static_age()
  cat.goToSleep()
  cat.feed()


## Generated JavaScript Example
##
## .. code-block:: c
##   /** Kitten Class (line 268, column 14). */
##   class Kitten {
##
##     /** Kitten Constructor (line 270, column 4). */
##     constructor(name, age, food, sleeping) {
##       this.name = name;
##       this.age = age;
##       this.food = food;
##       this.sleeping = sleeping;
##     };
##
##     /** Kitten.name Getter (line 276, column 4). */
##     get name() {
##       return this.name;
##     };
##
##     /** Kitten.static age Method (line 279, column 4). */
##     static age() {
##       return this.age;
##     };
##
##     /** Kitten.calcAge Method (line 282, column 4). */
##     calcAge() {
##       return this.age + 1;
##     };
##
##     /** Kitten.goToSleep Method (line 285, column 4). */
##     goToSleep() {
##       this.sleeping = this.sleeping == true;
##     };
##
##     /** Kitten.feed Method (line 288, column 4). */
##     #feed() {
##       this.food = this.food + 1.0;
##     };
##
##   };
##   export { Kitten };
