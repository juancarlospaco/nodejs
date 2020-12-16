## NodeJS Standard Library for Nim for JavaScript Target https://nodejs.org/api/zlib.html#zlib_convenience_methods
when not defined(js) and not defined(nimdoc): 
  {.fatal: "Module is designed to be used with the JavaScript backend.".}

func importNodeZlib*() {.importjs: "import * as node_zlib from 'v8'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireNodeZlib*() {.importjs: "const node_zlib = require('v8')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func brotliCompress*(buffer: cstring; callback: proc) {.importjs: "node_zlib.$1(#, #)".}
  ## https://nodejs.org/api/zlib.html#zlib_zlib_brotlicompress_buffer_options_callback

func brotliDecompress*(buffer: cstring; callback: proc) {.importjs: "node_zlib.$1(#, #)".}
  ## https://nodejs.org/api/zlib.html#zlib_zlib_brotlidecompress_buffer_options_callback

func deflate*(buffer: cstring; callback: proc) {.importjs: "node_zlib.$1(#, #)".}
  ## https://nodejs.org/api/zlib.html#zlib_zlib_deflate_buffer_options_callback

func deflateRaw*(buffer: cstring; callback: proc) {.importjs: "node_zlib.$1(#, #)".}
  ## https://nodejs.org/api/zlib.html#zlib_zlib_deflateraw_buffer_options_callback

func gunzip*(buffer: cstring; callback: proc) {.importjs: "node_zlib.$1(#, #)".}
  ## https://nodejs.org/api/zlib.html#zlib_zlib_gunzip_buffer_options_callback

func gzip*(buffer: cstring; callback: proc) {.importjs: "node_zlib.$1(#, #)".}
  ## https://nodejs.org/api/zlib.html#zlib_zlib_gzip_buffer_options_callback

func inflate*(buffer: cstring; callback: proc) {.importjs: "node_zlib.$1(#, #)".}
  ## https://nodejs.org/api/zlib.html#zlib_zlib_inflate_buffer_options_callback

func inflateRaw*(buffer: cstring; callback: proc) {.importjs: "node_zlib.$1(#, #)".}
  ## https://nodejs.org/api/zlib.html#zlib_zlib_inflateraw_buffer_options_callback

func unzip*(buffer: cstring; callback: proc) {.importjs: "node_zlib.$1(#, #)".}
  ## https://nodejs.org/api/zlib.html#zlib_zlib_unzip_buffer_options_callback
