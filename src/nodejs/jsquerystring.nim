
func importQuerystring*() {.importjs: "import * as querystring from 'querystring'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireQuerystring*() {.importjs: "const querystring = require('querystring')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func escape*(str: cstring): cstring {.importjs: "querystring.$1(#)".}
  ## https://nodejs.org/api/querystring.html#querystring_querystring_escape_str

func unescape*(str: cstring): cstring {.importjs: "querystring.$1(#)".}
  ## https://nodejs.org/api/querystring.html#querystring_querystring_unescape_str
