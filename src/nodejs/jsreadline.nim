## .. warning:: You MUST import `process` before importing this module. Uses `stdout` by default.
import std/jsffi

type Readline* = ref object of JsRoot ## https://nodejs.org/api/readline.html#readline_readline

func newReadline*(): Readline {.importjs: "readline.createInterface({input: process.stdin, output: process.stdout})".}
  ## https://nodejs.org/api/readline.html#readline_readline

func close*(self: Readline) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/readline.html#readline_rl_close

func pause*(self: Readline) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/readline.html#readline_rl_pause

func prompt*(self: Readline; preserveCursor: bool) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/readline.html#readline_rl_prompt_preservecursor

func question*[T](self: Readline; query: cstring; callback: T) {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/readline.html#readline_rl_question_query_options_callback

func resume*(self: Readline) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/readline.html#readline_rl_resume

func setPrompt*(self: Readline; prompt: cstring) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/readline.html#readline_rl_setprompt_prompt

func getPrompt*(self: Readline): cstring {.importjs: "#.$1()".}
  ## https://nodejs.org/api/readline.html#readline_rl_getprompt

func write*(self: Readline; data: cstring) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/readline.html#readline_rl_write_data_key

func write*(self: Readline; data: cstring; ctrl: bool; meta: bool; shift: bool; name: cstring) {.importjs: "#.$1(#, {ctrl: #, meta: #, shift: #, name: #})".}
  ## https://nodejs.org/api/readline.html#readline_rl_write_data_key

func getCursorPos*(self: Readline): JsObject {.importjs: "#.$1()".}
  ## https://nodejs.org/api/readline.html#readline_rl_getcursorpos

func line*(self: Readline): cstring {.importjs: "(() => { return #.line })()".}
  ## https://nodejs.org/api/readline.html#readline_rl_line

func cursor*(self: Readline): int {.importjs: "(() => { return #.cursor })()".}
  ## https://nodejs.org/api/readline.html#readline_rl_cursor

func importReadline*() {.importjs: "import * as readline from 'readline'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireReadline*() {.importjs: "const readline = require('readline')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func clearLine*(dir = 0.cint): bool {.importjs: "readline.$1(process.stout, #)".}
  ## https://nodejs.org/docs/latest/api/readline.html#readline_readline_clearline_stream_dir_callback

func clearScreenDown*(): bool {.importjs: "readline.$1(process.stout)".}
  ## https://nodejs.org/docs/latest/api/readline.html#readline_readline_clearscreendown_stream_callback

func cursorTo*(x, y: cint): bool {.importjs: "readline.$1(process.stout, #, #)".}
  ## https://nodejs.org/docs/latest/api/readline.html#readline_readline_cursorto_stream_x_y_callback

func moveCursor*(dx, dy: cint): bool {.importjs: "readline.$1(process.stout, #, #)".}
  ## https://nodejs.org/docs/latest/api/readline.html#readline_readline_movecursor_stream_dx_dy_callback


runnableExamples:
  import std/jsffi, nodejs/jsprocess
  requireProcess()
  requireReadline()
  block:
    doAssert clearLine()
    doAssert clearScreenDown()
    doAssert cursorTo(x = 0.cint, y = 0.cint)
    doAssert moveCursor(dx = 0.cint, dy = 0.cint)
  block:
    let rl: Readline = newReadline()
    rl.setPrompt(">>>".cstring)
    # doAssert rl.getPrompt() == ">>>".cstring
    doAssert rl.getCursorPos() is JsObject
    rl.pause()
    rl.resume()
    rl.write("data".cstring)
    rl.close()
    echo rl.line()
    echo rl.cursor()
