
func importInspector*() {.importjs: "import * as inspector from 'inspector'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireInspector*() {.importjs: "const inspector = require('inspector')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func close*(): cstring {.importjs: "inspector.$1()".}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_close

func inspectorConsoleLog*(args: auto): cstring {.importjs: "inspector.console.log(@)", varargs.}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_console

func inspectorConsoleInfo*(args: auto): cstring {.importjs: "inspector.console.info(@)", varargs.}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_console

func inspectorConsoleWarn*(args: auto): cstring {.importjs: "inspector.console.warn(@)", varargs.}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_console

func inspectorConsoleDebug*(args: auto): cstring {.importjs: "inspector.console.debug(@)", varargs.}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_console

func inspectorConsoleError*(args: auto): cstring {.importjs: "inspector.console.error(@)", varargs.}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_console

func inspectorConsoleTrace*(args: auto): cstring {.importjs: "inspector.console.trace(@)", varargs.}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_console

func inspectorConsoleClear*(): cstring {.importjs: "inspector.console.clear()".}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_console

func inspectorConsoleCount*(label = "".cstring): cstring {.importjs: "inspector.console.count(#)".}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_console

func inspectorConsoleCountReset*(label = "".cstring): cstring {.importjs: "inspector.console.countReset(#)".}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_console

func inspectorConsoleGroup*(label = "".cstring): cstring {.importjs: "inspector.console.group(#)".}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_console

func inspectorConsoleGroupCollapsed*(label = "".cstring): cstring {.importjs: "inspector.console.groupCollapsed(#)".}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_console

func inspectorConsoleGroupEnd*(): cstring {.importjs: "inspector.console.groupEnd()".}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_console

func inspectorConsoleTable*(): cstring {.importjs: "inspector.console.table()".}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_console

func open*(port: cint; host: cstring; wait = false): cstring {.importjs: "inspector.$1(#, #, #)".}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_open_port_host_wait

func open*(port: cint): cstring {.importjs: "inspector.$1(#)".}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_open_port_host_wait

func open*(): cstring {.importjs: "inspector.$1()".}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_open_port_host_wait

func url*(): cstring {.importjs: "inspector.$1()".}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_url

func waitForDebugger*() {.importjs: "inspector.$1()".}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_waitfordebugger
