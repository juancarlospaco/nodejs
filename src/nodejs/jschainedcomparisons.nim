## * Chained Comparisons for Nim, inspired by Python.
import std/macros

func b00l(n: NimNode): NimNode =
  result = n
  case n.kind
  of nnkInfix:
    if n[1].kind == nnkInfix:
      var x = nnkInfix.newTree(ident"and", b00l(n[1]))
      result = copyNimTree n
      result[1] = n[1][2]
      x.add result
      result = newStmtList(x)
    else: discard
  else: doAssert false, "Failed to Chain"

func flat(n: NimNode): NimNode =
  result = copyNimTree n
  case n.kind
  of nnkStmtList: result[0] = flat result[0]
  of nnkInfix:
    if n[1].kind == nnkStmtList: result[1] = flat result[1][0]
  else: doAssert false, "Failed to Flatten"

macro `{}`*(lhs, rhs: untyped): untyped =
  ## Example:
  ##
  ## .. code-block:: nim
  ##   echo bool{ 4 < cat < dog < fox <= 10 }
  ##
  ## Expands to:
  ##
  ## .. code-block:: nim
  ##   echo 4 < cat and cat < dog and dog < fox and fox <= 10
  if lhs.strVal == "bool":
    expectKind(rhs, nnkInfix)
    result = flat b00l(rhs)

runnableExamples"-b:js -d:nodejs":
  let x = 6
  let y = 2
  let z = 2
  doAssert not bool{ 4 < y < x < z <= 10 }
  doAssert bool{ y == z == 2 }
  doAssert not bool{ 1 < y != 2 }
  doAssert bool{ 4 < x }  # Works Ok for 1 comparison too.
  doAssert bool( 4 < x )  # Ignored, untouched.
