
func importNodeInspector*() {.importjs: "import * as node_inspector from 'inspector'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireNodeInspector*() {.importjs: "const node_inspector = require('inspector')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func close*(): cstring {.importjs: "node_inspector.$1()".}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_close

func inspectorConsoleLog*(args: any): cstring {.importjs: "node_inspector.console.log(@)", varargs.}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_console

func inspectorConsoleInfo*(args: any): cstring {.importjs: "node_inspector.console.info(@)", varargs.}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_console

func inspectorConsoleWarn*(args: any): cstring {.importjs: "node_inspector.console.warn(@)", varargs.}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_console

func inspectorConsoleDebug*(args: any): cstring {.importjs: "node_inspector.console.debug(@)", varargs.}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_console

func open*(port: cint; host: cstring; wait = false): cstring {.importjs: "node_inspector.$1(#, #, #)".}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_open_port_host_wait

func open*(port: cint): cstring {.importjs: "node_inspector.$1(#)".}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_open_port_host_wait

func open*(): cstring {.importjs: "node_inspector.$1()".}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_open_port_host_wait

func url*(): cstring {.importjs: "node_inspector.$1()".}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_url

func waitForDebugger*() {.importjs: "node_inspector.$1()".}
  ## https://nodejs.org/api/inspector.html#inspector_inspector_waitfordebugger
