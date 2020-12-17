
func importAsynchooks*() {.importjs: "import * as async_hooks from 'async_hooks'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireAsynchooks*() {.importjs: "const async_hooks = require('async_hooks')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func executionAsyncId*(): cint {.importjs: "async_hooks.$1()".}
  ## https://nodejs.org/api/async_hooks.html#async_hooks_async_hooks_executionasyncid

func triggerAsyncId*(): cint {.importjs: "async_hooks.$1()".}
  ## https://nodejs.org/api/async_hooks.html#async_hooks_async_hooks_triggerasyncid


runnableExamples:
  requireAsynchooks()
  echo triggerAsyncId()
  echo executionAsyncId()
