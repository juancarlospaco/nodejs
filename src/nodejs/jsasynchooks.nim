
func importNodeAsynchooks*() {.importjs: "import * as node_async_hooks from 'async_hooks'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireNodeAsynchooks*() {.importjs: "const node_async_hooks = require('async_hooks')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func executionAsyncId*(): cint {.importjs: "node_async_hooks.$1()".}
  ## https://nodejs.org/api/async_hooks.html#async_hooks_async_hooks_executionasyncid

func triggerAsyncId*(): cint {.importjs: "node_async_hooks.$1()".}
  ## https://nodejs.org/api/async_hooks.html#async_hooks_async_hooks_triggerasyncid
