
let pathDelimiter* {.importjs: "path.delimiter".}: cstring ## https://nodejs.org/api/path.html#path_path_delimiter

func importPath*() {.importjs: "import * as path from 'path'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requirePath*() {.importjs: "const path = require('path')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func basename*(path: cstring): cstring {.importjs: "path.$1(#)".}
  ## https://nodejs.org/api/path.html#path_path_basename_path_ext

func basename*(path, ext: cstring): cstring {.importjs: "path.$1(#, #)".}
  ## https://nodejs.org/api/path.html#path_path_basename_path_ext

func dirname*(path: cstring): cstring {.importjs: "path.$1(#)".}
  ## https://nodejs.org/api/path.html#path_path_dirname_path

func extname*(path: cstring): cstring {.importjs: "path.$1(#)".}
  ## https://nodejs.org/api/path.html#path_path_extname_path

func isAbsolute*(path: cstring): bool {.importjs: "path.$1(#)".}
  ## https://nodejs.org/api/path.html#path_path_isabsolute_path

func join*(paths: cstring): bool {.importjs: "path.$1(@)", varargs.}
  ## https://nodejs.org/api/path.html#path_path_join_paths

func normalize*(path: cstring): cstring {.importjs: "path.$1(#)".}
  ## https://nodejs.org/api/path.html#path_path_normalize_path

func parse*(path: cstring): any {.importjs: "path.$1(#)".}
  ## https://nodejs.org/api/path.html#path_path_parse_path

func relative*(to, frm: cstring): cstring {.importjs: "path.$1(#, #)".}
  ## https://nodejs.org/api/path.html#path_path_relative_from_to

func resolve*(paths: cstring): cstring {.importjs: "path.$1(@)", varargs.}
  ## https://nodejs.org/api/path.html#path_path_resolve_paths

func toNamespacedPath*(path: cstring): cstring {.importjs: "path.$1(#)".}
  ## https://nodejs.org/api/path.html#path_path_tonamespacedpath_path
