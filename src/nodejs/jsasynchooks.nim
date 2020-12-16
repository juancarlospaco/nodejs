## NodeJS Standard Library for Nim for JavaScript Target https://nodejs.org/api/async_hooks.html
when not defined(js) and not defined(nimdoc): 
  {.fatal: "Module is designed to be used with the JavaScript backend.".}

func importNodeV8*() {.importjs: "import * as node_async_hooks from 'async_hooks'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireNodeV8*() {.importjs: "const node_async_hooks = require('async_hooks')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func executionAsyncId*(): cint {.importjs: "node_async_hooks.$1()".}
  ## https://nodejs.org/api/async_hooks.html#async_hooks_async_hooks_executionasyncid

func triggerAsyncId*(): cint {.importjs: "node_async_hooks.$1()".}
  ## https://nodejs.org/api/async_hooks.html#async_hooks_async_hooks_triggerasyncid
