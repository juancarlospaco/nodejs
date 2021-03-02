import std/jsffi

type
  Module* = ref object of JsRoot ## https://nodejs.org/api/module.html#module_the_module_object
    builtinModules*: seq[cstring]  ## https://nodejs.org/api/module.html#module_module_builtinmodules

  SourceMap* = ref object of JsRoot ## https://nodejs.org/api/module.html#module_class_module_sourcemap
    payload*: JsObject

func importModule*() {.importjs: "import * as module from 'module'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireModule*() {.importjs: "const module = require('module')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func newSourceMap*(payload: JsObject): SourceMap {.importjs: "(new SourceMap(#))".}
  ## https://nodejs.org/api/module.html#module_new_sourcemap_payload

func syncBuiltinESMExports*() {.importjs: "module.$1()".}
  ## https://nodejs.org/api/module.html#module_module_syncbuiltinesmexports

func findSourceMap*(path: cstring): SourceMap {.importjs: "module.$1(#)".}
  ## https://nodejs.org/api/module.html#module_module_findsourcemap_path

func findEntry*(self: SourceMap; lineNumber: cint; columnNumber: cint): JsObject {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/module.html#module_module_findsourcemap_path
