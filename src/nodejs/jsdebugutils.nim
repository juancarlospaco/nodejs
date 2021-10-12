import std/macros

macro debugs*(frequency: static[int]; debugInBetween, codeToDebug: untyped) =
  ## Debug helper, injects `debugInBetween` in-between `codeToDebug` with given `frequency`, set `frequency` to `0` to disable debug.
  doAssert frequency >= 0, "frequency must be a positive integer >= 0"
  if frequency == 0: return codeToDebug  # If frequency is 0 do nothing.
  result = newTree(nnkStmtList)
  var freqCounter, debugCounter: int
  for line in codeToDebug.children:
    result.add line
    inc freqCounter
    if freqCounter mod frequency == 0:
      let infos = $debugCounter & '\t' & lineInfo(line) & '\t'
      result.add(quote do: echo(`infos`, getOccupiedMem()))
      inc debugCounter
      result.add debugInBetween

runnableExamples:
  debugs 2, echo("INBETWEEN"):
    var i = 1
    let x = 9
    var s = "a"
    i = 42
    i = i + x
    i = x
    s.add 'x'
    i = x + x

## Expands to:
##
## .. code-block:: nim
##    var i = 1
##    let x = 9
##    echo("INBETWEEN")
##    var s = "a"
##    i = 42
##    echo("INBETWEEN")
##    i = i + x
##    i = x
##    echo("INBETWEEN")
##    s.add 'x'
##    i = x + x
##    echo("INBETWEEN")
##
## - `debugInBetween` can be any "debugging code", like `echo`, `assert`, checks, dumps, etc.
## - `debugInBetween` is meant to be like `echo foo`, `assert foo != nil`, `echo foo.repr`, etc.
## - Change `frequency` to `0` then `debugInBetween` is NOT injected.
## - Change `frequency` to `1` then every `1` line `debugInBetween` is injected.
## - Change `frequency` to `2` then every `2` lines `debugInBetween` is injected.
## - Change `frequency` to `3` then every `3` lines `debugInBetween` is injected, etc.
## - Designed to debug a huge amount of lines by editing just 1 line.
