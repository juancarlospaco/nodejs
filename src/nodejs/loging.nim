## Structured JSON Logging, compile-time-unrolled to `file` and `stdout`.
## Zero memory allocations, fastest on Nimble (at time of writing).
import std/macros


macro logs*(file: var File; args: openArray[(string, auto)]; level: static[string] = "") =
  result = newStmtList()

  template writes(it) =
    result.add nnkCall.newTree(nnkDotExpr.newTree(file, newIdentNode"write"), it)
    result.add nnkCall.newTree(nnkDotExpr.newTree(newIdentNode"stdout", newIdentNode"write"), it)

  writes newLit('{')
  writes newLit('"')
  writes newLit('t')
  writes newLit('i')
  writes newLit('m')
  writes newLit('e')
  writes newLit('"')
  writes newLit(':')
  writes newLit('"')
  writes nnkPrefix.newTree(newIdentNode"$", nnkCall.newTree(newIdentNode"now"))
  writes newLit('"')
  writes newLit(',')
  if level.len > 0:
    writes newLit('"')
    writes newLit('l')
    writes newLit('v')
    writes newLit('l')
    writes newLit('"')
    writes newLit(':')
    writes newLit('"')
    writes newLit(level)
    writes newLit('"')
    writes newLit(',')
  for i, item in args:
    let key: string = item[1][0].strVal
    doAssert key.len > 0, "Key must not be empty string."
    writes newLit('"')
    for c in key: writes c.newLit
    writes newLit('"')
    writes newLit(':')
    case item[1][1].kind
    of nnkNilLit:
      writes newLit('n')
      writes newLit('u')
      writes newLit('l')
      writes newLit('l')
    of nnkIntLit .. nnkUInt64Lit, nnkFloatLit .. nnkFloat64Lit:
      writes item[1][1]
    else:
      writes newLit('"')
      writes item[1][1]
      writes newLit('"')
    if i < args.len - 1: writes newLit(',')
  writes newLit('}')
  writes newLit('\n')


runnableExamples"-r:off":
  import std/times
  var logfile: File = open("temp.json.log", fmWrite)
  logfile.logs {"key": "value"}
  close logfile


## Prints to `stdout` and writes to `temp.json.log`:
##
## .. code-block::
##   {"time":"2022-05-30T09:45:45-03:00","key":"value"}
##
## Expands to:
##
## .. code-block:: nim
##
##   write(logfile, '{')
##   write(stdout, '{')
##   write(logfile, '\"')
##   write(stdout, '\"')
##   write(logfile, 't')
##   write(stdout, 't')
##   write(logfile, 'i')
##   write(stdout, 'i')
##   write(logfile, 'm')
##   write(stdout, 'm')
##   write(logfile, 'e')
##   write(stdout, 'e')
##   write(logfile, '\"')
##   write(stdout, '\"')
##   write(logfile, ':')
##   write(stdout, ':')
##   write(logfile, '\"')
##   write(stdout, '\"')
##   write(logfile, $now())
##   write(stdout,  $now())
##   write(logfile, '\"')
##   write(stdout, '\"')
##   write(logfile, ',')
##   write(stdout, ',')
##   write(logfile, '\"')
##   write(stdout, '\"')
##   write(logfile, 'k')
##   write(stdout, 'k')
##   write(logfile, 'e')
##   write(stdout, 'e')
##   write(logfile, 'y')
##   write(stdout, 'y')
##   write(logfile, '\"')
##   write(stdout, '\"')
##   write(logfile, ':')
##   write(stdout, ':')
##   write(logfile, '\"')
##   write(stdout, '\"')
##   write(logfile, "value")
##   write(stdout, "value")
##   write(logfile, '\"')
##   write(stdout, '\"')
##   write(logfile, '}')
##   write(stdout, '}')
##   write(logfile, '\n')
##   write(stdout, '\n')
##
## The `file` can be buffered using the `bufSize` argument of `File.open(bufSize = 1024)` for more performance.
## Module name is NOT a typo.


runnableExamples"-r:off":
  import times
  var logfile: File = open("temp.json.log", fmWrite)
  logfile.logs {"key": 3.14, "key2": -0.00000000001}
  close logfile
