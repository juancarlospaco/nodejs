## Read-Eval-Print-Loop (REPL) implementation that is available both as a standalone program or includible in other applications.
from std/jsffi import JsObject

type REPLServer* = ref object of JsRoot ## https://nodejs.org/api/repl.html#repl_class_replserver
  options*: JsObject
  builtinModules*: seq[cstring]

func importRepl*() {.importjs: "import * as repl from 'repl'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireRepl*() {.importjs: "const repl = require('repl')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func newREPLServer*(options: JsObject): REPLServer {.importjs: "repl.start(#)".}
  ## Alias for `repl.start(options)`.

func defineCommand*(self: REPLServer; keyword: cstring; cmd: JsObject) {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/repl.html#repl_replserver_definecommand_keyword_cmd

func displayPrompt*(self: REPLServer; preserveCursor: bool) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/repl.html#repl_replserver_displayprompt_preservecursor

func clearBufferedCommand*(self: REPLServer) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/repl.html#repl_replserver_displayprompt_preservecursor

func parseREPLKeyword*(self: REPLServer; keyword: cstring; rest: auto): bool {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/repl.html#repl_replserver_parsereplkeyword_keyword_rest

func setupHistory*[T](self: REPLServer; historyPath: cstring; callback: T) {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/repl.html#repl_replserver_setuphistory_historypath_callback

func onExit*[T](self: REPLServer; callback: T) {.importjs: "#.on('exit', #)".}
  ## Alias for `repl.on('exit', callback)`.

func onReset*(self: REPLServer; item: auto) {.importjs: "#.on('reset', #)".}
  ## Alias for `repl.on('reset', item)`.
