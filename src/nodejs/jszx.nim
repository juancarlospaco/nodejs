## * `Google ZX v1.x <https://github.com/google/zx>`_ for `Nim <http://nim-lang.org>`_.
when not defined(js) and not defined(nimdoc): {.fatal: "Must use JavaScript targets".}
import std/[asyncjs, jsfetch]

type ProcessOutput* = ref object of JsRoot
  stdout*, stderr*: cstring
  exitCode*: int

var
  zxprefix* {.importjs: "$$.prefix".}: cstring
  zxshell* {.importjs: "$$.shell".}: cstring
  zxverbose* {.importjs: "$$.verbose".}: bool

func cd*(path: cstring) {.importjs: "$1(#)".}
func sleep*(time: SomeInteger) {.importjs: "$1(#)".}
func toCstring*(self: ProcessOutput): cstring {.importjs: "(#.toString() || '')".}
func question*(query: cstring): Future[cstring] {.importjs: "$1(#)", discardable.}
func fetch*(url: cstring): Future[Response] {.importjs: "$1(#)".}
func fetch*(url: cstring; options: FetchOptions): Future[Response] {.importjs: "$1(#)".}
func nothrow*[T](promise: T): T {.importjs: "$1(#)", discardable.}
func `$$`*(commands: cstring): Future[ProcessOutput] {.importjs: "$$`#`", discardable.}

runnableExamples("-b:js -r:off -d:danger -d:nimExperimentalJsfetch"):
  import std/[jsffi, asyncjs, jsfetch]
  proc main() {.async.} =
    echo zxprefix, zxshell
    doAssert zxverbose
    sleep 9
    discard(await question"Whats up?")
    discard(await $$"pwd")
    discard(await nothrow($$"NONEXISTENT"))
    echo toCstring(await $$"pwd")
    let resp = await fetch"http://wttr.in"
    if resp.ok:
      echo(await resp.text())
    cd"/tmp"
  discard main()
