
let
  Z_NO_FLUSH* {.importjs: "zlib.constants.Z_NO_FLUSH".}: cint
  Z_PARTIAL_FLUSH* {.importjs: "zlib.constants.Z_PARTIAL_FLUSH".}: cint
  Z_SYNC_FLUSH* {.importjs: "zlib.constants.Z_SYNC_FLUSH".}: cint
  Z_FULL_FLUSH* {.importjs: "zlib.constants.Z_FULL_FLUSH".}: cint
  Z_FINISH* {.importjs: "zlib.constants.Z_FINISH".}: cint
  Z_BLOCK* {.importjs: "zlib.constants.Z_BLOCK".}: cint
  Z_TREES* {.importjs: "zlib.constants.Z_TREES".}: cint
  Z_OK* {.importjs: "zlib.constants.Z_OK".}: cint
  Z_STREAM_END* {.importjs: "zlib.constants.Z_STREAM_END".}: cint
  Z_NEED_DICT* {.importjs: "zlib.constants.Z_NEED_DICT".}: cint
  Z_ERRNO* {.importjs: "zlib.constants.Z_ERRNO".}: cint
  Z_STREAM_ERROR* {.importjs: "zlib.constants.Z_STREAM_ERROR".}: cint
  Z_DATA_ERROR* {.importjs: "zlib.constants.Z_DATA_ERROR".}: cint
  Z_MEM_ERROR* {.importjs: "zlib.constants.Z_MEM_ERROR".}: cint
  Z_BUF_ERROR* {.importjs: "zlib.constants.Z_BUF_ERROR".}: cint
  Z_VERSION_ERROR* {.importjs: "zlib.constants.Z_VERSION_ERROR".}: cint
  Z_NO_COMPRESSION* {.importjs: "zlib.constants.Z_NO_COMPRESSION".}: cint
  Z_BEST_SPEED* {.importjs: "zlib.constants.Z_BEST_SPEED".}: cint
  Z_BEST_COMPRESSION* {.importjs: "zlib.constants.Z_BEST_COMPRESSION".}: cint
  Z_DEFAULT_COMPRESSION* {.importjs: "zlib.constants.Z_DEFAULT_COMPRESSION".}: cint
  Z_FILTERED* {.importjs: "zlib.constants.Z_FILTERED".}: cint
  Z_HUFFMAN_ONLY* {.importjs: "zlib.constants.Z_HUFFMAN_ONLY".}: cint
  Z_RLE* {.importjs: "zlib.constants.Z_RLE".}: cint
  Z_FIXED* {.importjs: "zlib.constants.Z_FIXED".}: cint
  Z_DEFAULT_STRATEGY* {.importjs: "zlib.constants.Z_DEFAULT_STRATEGY".}: cint
  BROTLI_OPERATION_PROCESS* {.importjs: "zlib.constants.BROTLI_OPERATION_PROCESS ".}: cint
  BROTLI_OPERATION_FLUSH* {.importjs: "zlib.constants.BROTLI_OPERATION_FLUSH ".}: cint
  BROTLI_OPERATION_FINISH* {.importjs: "zlib.constants.BROTLI_OPERATION_FINISH ".}: cint
  BROTLI_OPERATION_EMIT_METADATA* {.importjs: "zlib.constants.BROTLI_OPERATION_EMIT_METADATA".}: cint

func importZlib*() {.importjs: "import * as zlib from 'zlib'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireZlib*() {.importjs: "const zlib = require('zlib')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func brotliCompress*[T](buffer: cstring; callback: T) {.importjs: "zlib.$1(#, #)".}
  ## https://nodejs.org/api/zlib.html#zlib_zlib_brotlicompress_buffer_options_callback

func brotliDecompress*[T](buffer: cstring; callback: T) {.importjs: "zlib.$1(#, #)".}
  ## https://nodejs.org/api/zlib.html#zlib_zlib_brotlidecompress_buffer_options_callback

func deflate*[T](buffer: cstring; callback: T) {.importjs: "zlib.$1(#, #)".}
  ## https://nodejs.org/api/zlib.html#zlib_zlib_deflate_buffer_options_callback

func deflateRaw*[T](buffer: cstring; callback: T) {.importjs: "zlib.$1(#, #)".}
  ## https://nodejs.org/api/zlib.html#zlib_zlib_deflateraw_buffer_options_callback

func gunzip*[T](buffer: cstring; callback: T) {.importjs: "zlib.$1(#, #)".}
  ## https://nodejs.org/api/zlib.html#zlib_zlib_gunzip_buffer_options_callback

func gzip*[T](buffer: cstring; callback: T) {.importjs: "zlib.$1(#, #)".}
  ## https://nodejs.org/api/zlib.html#zlib_zlib_gzip_buffer_options_callback

func inflate*[T](buffer: cstring; callback: T) {.importjs: "zlib.$1(#, #)".}
  ## https://nodejs.org/api/zlib.html#zlib_zlib_inflate_buffer_options_callback

func inflateRaw*[T](buffer: cstring; callback: T) {.importjs: "zlib.$1(#, #)".}
  ## https://nodejs.org/api/zlib.html#zlib_zlib_inflateraw_buffer_options_callback

func unzip*[T](buffer: cstring; callback: T) {.importjs: "zlib.$1(#, #)".}
  ## https://nodejs.org/api/zlib.html#zlib_zlib_unzip_buffer_options_callback


runnableExamples:
  requireZlib()
  const s = "My Imagination Is Very Limited. It Usually Involves Inflicting Pain In Ways That May Not Have Occurred To Most.".cstring
  proc foo() = echo "callback called"
  brotliCompress(s, foo)
  gzip(s, foo)
  deflate(s, foo)
  deflateRaw(s, foo)
