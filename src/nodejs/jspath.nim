from std/jsffi import JsObject

let delimiter* {.importjs: "path.delimiter".}: cstring ## https://nodejs.org/api/path.html#path_path_delimiter

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

func join*(paths: cstring): cstring {.importjs: "path.$1(@)", varargs.}
  ## https://nodejs.org/api/path.html#path_path_join_paths

func `/`*(path0: cstring; path1: cstring): cstring {.importjs: "path.join(#, #)".}
  ## Syntax sugar for `path.join()` that mimics Nim `path0 / path1`.

func normalize*(path: cstring): cstring {.importjs: "path.$1(#)".}
  ## https://nodejs.org/api/path.html#path_path_normalize_path

func relative*(to, froom: cstring): cstring {.importjs: "path.$1(#, #)".}
  ## https://nodejs.org/api/path.html#path_path_relative_from_to

func resolve*(paths: cstring): cstring {.importjs: "path.$1(@)", varargs.}
  ## https://nodejs.org/api/path.html#path_path_resolve_paths

func toNamespacedPath*(path: cstring): cstring {.importjs: "path.$1(#)".}
  ## https://nodejs.org/api/path.html#path_path_tonamespacedpath_path

func parse*(path: cstring): JsObject {.importjs: "path.$1(#)".}
  ## https://nodejs.org/api/path.html#path_path_parse_path

when defined(windows):
  func requirePathWin32*() {.importjs: "const path = require('path').win32@".}
    ## https://nodejs.org/api/path.html#path_windows_vs_posix

when defined(linux) or defined(posix):
  func requirePathPosix*() {.importjs: "const path = require('path').posix@".}
    ## https://nodejs.org/api/path.html#path_windows_vs_posix


runnableExamples"-r:off":
  requirePath()
  echo delimiter
  doAssert basename("/foo/bar/baz".cstring) == "baz".cstring
  doAssert dirname("/foo/bar/baz/file.ext".cstring) == "/foo/bar/baz".cstring
  doAssert extname("/foo/bar/baz/file.ext".cstring) == ".ext".cstring
  doAssert isAbsolute("/foo/bar/baz/file.ext".cstring)
  doAssert normalize("/foo/bar/baz/file.ext".cstring) == "/foo/bar/baz/file.ext".cstring
  doAssert normalize("/foo/bar/baz/file.ext".cstring) == "/foo/bar/baz/file.ext".cstring
  doAssert relative("/foo/bar/baz/file.ext".cstring, "/x/".cstring) == "../../../../x".cstring
  doAssert resolve("/foo/bar/baz/file.ext".cstring) == "/foo/bar/baz/file.ext".cstring
  doAssert toNamespacedPath("/foo/bar/baz/file.ext".cstring) == "/foo/bar/baz/file.ext".cstring
  doAssert join("foo".cstring, "bar".cstring, "file.ext".cstring) == "foo/bar/file.ext".cstring
  doAssert "folder".cstring / "file.ext".cstring == "folder/file.ext".cstring
