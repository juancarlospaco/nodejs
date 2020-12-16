## NodeJS Standard Library for Nim for JavaScript Target https://nodejs.org/api/path.html
when not defined(js) and not defined(nimdoc): 
  {.fatal: "Module is designed to be used with the JavaScript backend.".}

func importNodePath*() {.importjs: "import * as node_path from 'path'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireNodePath*() {.importjs: "const node_path = require('path')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func basename*(path: cstring): cstring {.importjs: "node_path.$1(#)".}
  ## https://nodejs.org/api/path.html#path_path_basename_path_ext

func basename*(path, ext: cstring): cstring {.importjs: "node_path.$1(#, #)".}
  ## https://nodejs.org/api/path.html#path_path_basename_path_ext

func dirname*(path: cstring): cstring {.importjs: "node_path.$1(#)".}
  ## https://nodejs.org/api/path.html#path_path_dirname_path

func extname*(path: cstring): cstring {.importjs: "node_path.$1(#)".}
  ## https://nodejs.org/api/path.html#path_path_extname_path

func isAbsolute*(path: cstring): bool {.importjs: "node_path.$1(#)".}
  ## https://nodejs.org/api/path.html#path_path_isabsolute_path

func join*(paths: cstring): bool {.importjs: "node_path.$1(@)", varargs.}
  ## https://nodejs.org/api/path.html#path_path_join_paths

func normalize*(path: cstring): cstring {.importjs: "node_path.$1(#)".}
  ## https://nodejs.org/api/path.html#path_path_normalize_path

func parse*(path: cstring): any {.importjs: "node_path.$1(#)".}
  ## https://nodejs.org/api/path.html#path_path_parse_path

func relative*(to, frm: cstring): cstring {.importjs: "node_path.$1(#, #)".}
  ## https://nodejs.org/api/path.html#path_path_relative_from_to

func resolve*(paths: cstring): cstring {.importjs: "node_path.$1(@)", varargs.}
  ## https://nodejs.org/api/path.html#path_path_resolve_paths

func toNamespacedPath*(path: cstring): cstring {.importjs: "node_path.$1(#)".}
  ## https://nodejs.org/api/path.html#path_path_tonamespacedpath_path
