## NodeJS Standard Library for Nim for JavaScript Target https://nodejs.org/api/vm.html
when not defined(js) and not defined(nimdoc): 
  {.fatal: "Module is designed to be used with the JavaScript backend.".}

func importNodeQuerystring*() {.importjs: "import * as node_querystring from 'querystring'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireNodeQuerystring*() {.importjs: "const node_querystring = require('querystring')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func escape*(str: cstring): cstring {.importjs: "node_querystring.$1(#)".}
  ## https://nodejs.org/api/querystring.html#querystring_querystring_escape_str

func unescape*(str: cstring): cstring {.importjs: "node_querystring.$1(#)".}
  ## https://nodejs.org/api/querystring.html#querystring_querystring_unescape_str
