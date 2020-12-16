
func importNodeOs*() {.importjs: "import * as node_os from 'os'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireNodeOs*() {.importjs: "const node_os = require('os')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func arch*(): cstring {.importjs: "node_os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_arch

func endianness*(): cstring {.importjs: "node_os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_endianness

func freemem*(): cint {.importjs: "node_os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_freemem

func getPriority*(pid = 0.cint): cint {.importjs: "node_os.$1(#)".}
  ## https://nodejs.org/api/os.html#os_os_getpriority_pid

func homedir*(): cstring {.importjs: "node_os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_homedir

func loadavg*(): seq[cint] {.importjs: "node_os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_loadavg

func platform*(): cstring {.importjs: "node_os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_platform

func release*(): cstring {.importjs: "node_os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_release

func setPriority*(priority: cint) {.importjs: "node_os.$1(#)".}
  ## https://nodejs.org/api/os.html#os_os_setpriority_pid_priority

func setPriority*(pid, priority: cint) {.importjs: "node_os.$1(#, #)".}
  ## https://nodejs.org/api/os.html#os_os_setpriority_pid_priority

func tmpdir*(): cstring {.importjs: "node_os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_tmpdir

func totalmem*(): cint {.importjs: "node_os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_totalmem

func ostype*(): cstring {.importjs: "node_os.type()".}
  ## https://nodejs.org/api/os.html#os_os_type

func uptimeOs*(): cint {.importjs: "node_os.uptime()".}
  ## https://nodejs.org/api/os.html#os_os_uptime

func version*(): cstring {.importjs: "node_os.$1()".}
  ## https://nodejs.org/api/os.html#os_os_version
