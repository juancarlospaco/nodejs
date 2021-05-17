## * WebAssembly for Nim.
import std/jsffi
export jsffi

type WASI* = ref object of JsRoot  ## https://nodejs.org/api/wasi.html#wasi_class_wasi

let wasiImport* {.importjs: "wasi.wasiImport".}: JsObject

func importWasi*() {.importjs: "import * as wasi from 'wasi'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireWasi*() {.importjs: "const wasi = require('wasi')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func newWasi*(options: JsObject): WASI {.importjs: "(new WASI(#))".}
  ## https://nodejs.org/api/wasi.html#wasi_new_wasi_options

func start*(self: WASI) {.importjs: "wasi.$1(#)".}
  ## https://nodejs.org/api/wasi.html#wasi_wasi_start_instance

func initialize*(self: WASI) {.importjs: "wasi.$1(#)".}
  ## https://nodejs.org/api/wasi.html#wasi_wasi_initialize_instance
