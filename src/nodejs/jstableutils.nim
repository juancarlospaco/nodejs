## * Getter for `Table` and `OrderedTable`, takes a variable and a block of code.
import std/[tables, macros]

macro get*[A, B](self: var Table[A, B] | var OrderedTable[A, B]; key, body: untyped) =
  doAssert key.kind == nnkInfix,    "Invalid argument: " & $key
  doAssert key[0].strVal == "as",   "Invalid argument: Missing 'as'."
  doAssert key[2].kind == nnkIdent, "New variable must be nnkIdent."
  iterator internalIter[T](self: var T): var T {.inline.} = yield self
  let a = key[1]
  let b = key[2]
  result = quote do:
    withValue(`self`, `a`, c) do:
      for `b` in internalIter(c[]): `body`


runnableExamples:
  import std/tables

  var tabla: Table[string, int]
  tabla["example"] = 42
  tabla["another"] = 9

  tabla.get "example" as value:
    echo value
    doAssert value == 42

  tabla.get "THIS_KEY_DOES_NOT_EXIST" as value:
    doAssert false, "WONT RUN"
    echo "Faster and simpler Table use without Option[T]"
