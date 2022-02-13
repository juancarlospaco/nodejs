## * Debugging helpers.
import std/macros


macro debugs*(frequency: static[int]; debugInBetween, codeToDebug: untyped) =
  ## Debug helper, injects `debugInBetween` in-between `codeToDebug` with given `frequency`, set `frequency` to `0` to disable debug.
  ##
  ## .. Warning:: Designed for debugging purposes only.
  doAssert frequency >= 0, "frequency must be a positive integer >= 0"
  if frequency == 0: return codeToDebug  # If frequency is 0 do nothing.
  result = newTree(nnkStmtList)
  var freqCounter, debugCounter: int
  for line in codeToDebug.children:
    result.add line
    inc freqCounter
    if freqCounter mod frequency == 0:
      var s = "DEBUG\t" & $debugCounter & '\t' & lineInfo(line)
      result.add nnkStmtList.newTree(nnkCall.newTree(newIdentNode"echo", newLit(s)))
      result.add debugInBetween
      inc debugCounter


macro debugs*(frequency: static[int]; debugBefore, debugInBetween, debugAfter, codeToDebug: untyped) =
  ## Same as `debugs` but injects `debugBefore` before `codeToDebug` and `debugAfter` after `codeToDebug`.
  doAssert frequency >= 0, "frequency must be a positive integer >= 0"
  if frequency == 0: return codeToDebug
  result = newTree(nnkStmtList)
  var freqCounter, debugCounter: int
  if freqCounter mod frequency == 0:
    result.add debugBefore
  for line in codeToDebug.children:
    result.add line
    inc freqCounter
    if freqCounter mod frequency == 0:
      var s = "DEBUG\t" & $debugCounter & '\t' & lineInfo(line)
      result.add nnkStmtList.newTree(nnkCall.newTree(newIdentNode"echo", newLit(s)))
      result.add debugInBetween
      inc debugCounter
  if freqCounter mod frequency == 0:
    result.add debugAfter


runnableExamples:
  debugs 2, echo("INBETWEEN ", i > 0):
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
##    echo("INBETWEEN ", i > 0)
##    var s = "a"
##    i = 42
##    echo("INBETWEEN ", i > 0)
##    i = i + x
##    i = x
##    echo("INBETWEEN ", i > 0)
##    s.add 'x'
##    i = x + x
##    echo("INBETWEEN ", i > 0)
##
## - `debugInBetween` can be any "debugging code", like `echo`, `assert`, checks, dumps, etc.
## - `debugInBetween` is meant to be like `echo foo`, `assert foo != nil`, `echo foo.repr`, etc.
## - `debugInBetween` can be any custom procedure call too.
## - Change `frequency` to `0` then `debugInBetween` is NOT injected.
## - Change `frequency` to `1` then every `1` line `debugInBetween` is injected.
## - Change `frequency` to `2` then every `2` lines `debugInBetween` is injected.
## - Change `frequency` to `3` then every `3` lines `debugInBetween` is injected, etc.
## - Designed to debug a huge amount of lines by editing just 1 line.


runnableExamples:
  proc debuggingProc() =
    echo "This is an Example"
    echo getOccupiedMem()
    # echo now()

  debugs 1, debuggingProc():
    var i = 1
    let x = 9
    var s = "a"
    i = 42
    i = i + x
    i = x
    s.add 'x'
    i = x + x


runnableExamples:
  debugs 2, echo"BEFORE", echo"INBETWEEN", echo"AFTER":
      var i = 1
      let x = 9
      var s = "a"
      i = 42
      i = i + x
      i = x
      s.add 'x'
      i = x + x
