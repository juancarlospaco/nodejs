
let
  Z_NO_FLUSH* {.importjs: "zlib.constants.Z_NO_FLUSH".}: cint
  Z_PARTIAL_FLUSH* {.importjs: "zlib.constants.Z_PARTIAL_FLUSH".}: cint
  Z_SYNC_FLUSH* {.importjs: "zlib.constants.Z_SYNC_FLUSH".}: cint
  Z_FULL_FLUSH* {.importjs: "zlib.constants.Z_FULL_FLUSH".}: cint
  Z_FINISH* {.importjs: "zlib.constants.Z_FINISH".}: cint
  Z_BLOCK* {.importjs: "zlib.constants.Z_BLOCK".}: cint
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
  ZLIB_VERNUM* {.importjs: "zlib.constants.ZLIB_VERNUM".}: cint
  DEFLATE* {.importjs: "zlib.constants.DEFLATE".}: cint
  INFLATE* {.importjs: "zlib.constants.INFLATE".}: cint
  GZIP* {.importjs: "zlib.constants.GZIP".}: cint
  GUNZIP* {.importjs: "zlib.constants.GUNZIP".}: cint
  DEFLATERAW* {.importjs: "zlib.constants.DEFLATERAW".}: cint
  INFLATERAW* {.importjs: "zlib.constants.INFLATERAW".}: cint
  UNZIP* {.importjs: "zlib.constants.UNZIP".}: cint
  BROTLI_DECODE* {.importjs: "zlib.constants.BROTLI_DECODE".}: cint
  BROTLI_ENCODE* {.importjs: "zlib.constants.BROTLI_ENCODE".}: cint
  Z_MIN_WINDOWBITS* {.importjs: "zlib.constants.Z_MIN_WINDOWBITS".}: cint
  Z_MAX_WINDOWBITS* {.importjs: "zlib.constants.Z_MAX_WINDOWBITS".}: cint
  Z_DEFAULT_WINDOWBITS* {.importjs: "zlib.constants.Z_DEFAULT_WINDOWBITS".}: cint
  Z_MIN_CHUNK* {.importjs: "zlib.constants.Z_MIN_CHUNK".}: cint
  Z_MAX_CHUNK* {.importjs: "zlib.constants.Z_MAX_CHUNK".}: cint
  Z_DEFAULT_CHUNK* {.importjs: "zlib.constants.Z_DEFAULT_CHUNK".}: cint
  Z_MIN_MEMLEVEL* {.importjs: "zlib.constants.Z_MIN_MEMLEVEL".}: cint
  Z_MAX_MEMLEVEL* {.importjs: "zlib.constants.Z_MAX_MEMLEVEL".}: cint
  Z_DEFAULT_MEMLEVEL* {.importjs: "zlib.constants.Z_DEFAULT_MEMLEVEL".}: cint
  Z_MIN_LEVEL* {.importjs: "zlib.constants.Z_MIN_LEVEL".}: cint
  Z_MAX_LEVEL* {.importjs: "zlib.constants.Z_MAX_LEVEL".}: cint
  Z_DEFAULT_LEVEL* {.importjs: "zlib.constants.Z_DEFAULT_LEVEL".}: cint
  BROTLI_OPERATION_PROCESS* {.importjs: "zlib.constants.BROTLI_OPERATION_PROCESS".}: cint
  BROTLI_OPERATION_FLUSH* {.importjs: "zlib.constants.BROTLI_OPERATION_FLUSH".}: cint
  BROTLI_OPERATION_FINISH* {.importjs: "zlib.constants.BROTLI_OPERATION_FINISH".}: cint
  BROTLI_OPERATION_EMIT_METADATA* {.importjs: "zlib.constants.BROTLI_OPERATION_EMIT_METADATA".}: cint
  BROTLI_PARAM_MODE* {.importjs: "zlib.constants.BROTLI_PARAM_MODE".}: cint
  BROTLI_MODE_GENERIC* {.importjs: "zlib.constants.BROTLI_MODE_GENERIC".}: cint
  BROTLI_MODE_TEXT* {.importjs: "zlib.constants.BROTLI_MODE_TEXT".}: cint
  BROTLI_MODE_FONT* {.importjs: "zlib.constants.BROTLI_MODE_FONT".}: cint
  BROTLI_DEFAULT_MODE* {.importjs: "zlib.constants.BROTLI_DEFAULT_MODE".}: cint
  BROTLI_PARAM_QUALITY* {.importjs: "zlib.constants.BROTLI_PARAM_QUALITY".}: cint
  BROTLI_MIN_QUALITY* {.importjs: "zlib.constants.BROTLI_MIN_QUALITY".}: cint
  BROTLI_MAX_QUALITY* {.importjs: "zlib.constants.BROTLI_MAX_QUALITY".}: cint
  BROTLI_DEFAULT_QUALITY* {.importjs: "zlib.constants.BROTLI_DEFAULT_QUALITY".}: cint
  BROTLI_PARAM_LGWIN* {.importjs: "zlib.constants.BROTLI_PARAM_LGWIN".}: cint
  BROTLI_MIN_WINDOW_BITS* {.importjs: "zlib.constants.BROTLI_MIN_WINDOW_BITS".}: cint
  BROTLI_MAX_WINDOW_BITS* {.importjs: "zlib.constants.BROTLI_MAX_WINDOW_BITS".}: cint
  BROTLI_LARGE_MAX_WINDOW_BITS* {.importjs: "zlib.constants.BROTLI_LARGE_MAX_WINDOW_BITS".}: cint
  BROTLI_DEFAULT_WINDOW* {.importjs: "zlib.constants.BROTLI_DEFAULT_WINDOW".}: cint
  BROTLI_PARAM_LGBLOCK* {.importjs: "zlib.constants.BROTLI_PARAM_LGBLOCK".}: cint
  BROTLI_MIN_INPUT_BLOCK_BITS* {.importjs: "zlib.constants.BROTLI_MIN_INPUT_BLOCK_BITS".}: cint
  BROTLI_MAX_INPUT_BLOCK_BITS* {.importjs: "zlib.constants.BROTLI_MAX_INPUT_BLOCK_BITS".}: cint
  BROTLI_PARAM_DISABLE_LITERAL_CONTEXT_MODELING* {.importjs: "zlib.constants.BROTLI_PARAM_DISABLE_LITERAL_CONTEXT_MODELING".}: cint
  BROTLI_PARAM_SIZE_HINT* {.importjs: "zlib.constants.BROTLI_PARAM_SIZE_HINT".}: cint
  BROTLI_PARAM_LARGE_WINDOW* {.importjs: "zlib.constants.BROTLI_PARAM_LARGE_WINDOW".}: cint
  BROTLI_PARAM_NPOSTFIX* {.importjs: "zlib.constants.BROTLI_PARAM_NPOSTFIX".}: cint
  BROTLI_PARAM_NDIRECT* {.importjs: "zlib.constants.BROTLI_PARAM_NDIRECT".}: cint
  BROTLI_DECODER_RESULT_ERROR* {.importjs: "zlib.constants.BROTLI_DECODER_RESULT_ERROR".}: cint
  BROTLI_DECODER_RESULT_SUCCESS* {.importjs: "zlib.constants.BROTLI_DECODER_RESULT_SUCCESS".}: cint
  BROTLI_DECODER_RESULT_NEEDS_MORE_INPUT* {.importjs: "zlib.constants.BROTLI_DECODER_RESULT_NEEDS_MORE_INPUT".}: cint
  BROTLI_DECODER_RESULT_NEEDS_MORE_OUTPUT* {.importjs: "zlib.constants.BROTLI_DECODER_RESULT_NEEDS_MORE_OUTPUT".}: cint
  BROTLI_DECODER_PARAM_DISABLE_RING_BUFFER_REALLOCATION* {.importjs: "zlib.constants.BROTLI_DECODER_PARAM_DISABLE_RING_BUFFER_REALLOCATION".}: cint
  BROTLI_DECODER_PARAM_LARGE_WINDOW* {.importjs: "zlib.constants.BROTLI_DECODER_PARAM_LARGE_WINDOW".}: cint
  BROTLI_DECODER_NO_ERROR* {.importjs: "zlib.constants.BROTLI_DECODER_NO_ERROR".}: cint
  BROTLI_DECODER_SUCCESS* {.importjs: "zlib.constants.BROTLI_DECODER_SUCCESS".}: cint
  BROTLI_DECODER_NEEDS_MORE_INPUT* {.importjs: "zlib.constants.BROTLI_DECODER_NEEDS_MORE_INPUT".}: cint
  BROTLI_DECODER_NEEDS_MORE_OUTPUT* {.importjs: "zlib.constants.BROTLI_DECODER_NEEDS_MORE_OUTPUT".}: cint
  BROTLI_DECODER_ERROR_FORMAT_EXUBERANT_NIBBLE* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_FORMAT_EXUBERANT_NIBBLE".}: cint
  BROTLI_DECODER_ERROR_FORMAT_RESERVED* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_FORMAT_RESERVED".}: cint
  BROTLI_DECODER_ERROR_FORMAT_EXUBERANT_META_NIBBLE* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_FORMAT_EXUBERANT_META_NIBBLE".}: cint
  BROTLI_DECODER_ERROR_FORMAT_SIMPLE_HUFFMAN_ALPHABET* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_FORMAT_SIMPLE_HUFFMAN_ALPHABET".}: cint
  BROTLI_DECODER_ERROR_FORMAT_SIMPLE_HUFFMAN_SAME* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_FORMAT_SIMPLE_HUFFMAN_SAME".}: cint
  BROTLI_DECODER_ERROR_FORMAT_CL_SPACE* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_FORMAT_CL_SPACE".}: cint
  BROTLI_DECODER_ERROR_FORMAT_HUFFMAN_SPACE* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_FORMAT_HUFFMAN_SPACE".}: cint
  BROTLI_DECODER_ERROR_FORMAT_CONTEXT_MAP_REPEAT* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_FORMAT_CONTEXT_MAP_REPEAT".}: cint
  BROTLI_DECODER_ERROR_FORMAT_BLOCK_LENGTH_1* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_FORMAT_BLOCK_LENGTH_1".}: cint
  BROTLI_DECODER_ERROR_FORMAT_BLOCK_LENGTH_2* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_FORMAT_BLOCK_LENGTH_2".}: cint
  BROTLI_DECODER_ERROR_FORMAT_TRANSFORM* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_FORMAT_TRANSFORM".}: cint
  BROTLI_DECODER_ERROR_FORMAT_DICTIONARY* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_FORMAT_DICTIONARY".}: cint
  BROTLI_DECODER_ERROR_FORMAT_WINDOW_BITS* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_FORMAT_WINDOW_BITS".}: cint
  BROTLI_DECODER_ERROR_FORMAT_PADDING_1* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_FORMAT_PADDING_1".}: cint
  BROTLI_DECODER_ERROR_FORMAT_PADDING_2* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_FORMAT_PADDING_2".}: cint
  BROTLI_DECODER_ERROR_FORMAT_DISTANCE* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_FORMAT_DISTANCE".}: cint
  BROTLI_DECODER_ERROR_DICTIONARY_NOT_SET* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_DICTIONARY_NOT_SET".}: cint
  BROTLI_DECODER_ERROR_INVALID_ARGUMENTS* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_INVALID_ARGUMENTS".}: cint
  BROTLI_DECODER_ERROR_ALLOC_CONTEXT_MODES* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_ALLOC_CONTEXT_MODES".}: cint
  BROTLI_DECODER_ERROR_ALLOC_TREE_GROUPS* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_ALLOC_TREE_GROUPS".}: cint
  BROTLI_DECODER_ERROR_ALLOC_CONTEXT_MAP* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_ALLOC_CONTEXT_MAP".}: cint
  BROTLI_DECODER_ERROR_ALLOC_RING_BUFFER_1* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_ALLOC_RING_BUFFER_1".}: cint
  BROTLI_DECODER_ERROR_ALLOC_RING_BUFFER_2* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_ALLOC_RING_BUFFER_2".}: cint
  BROTLI_DECODER_ERROR_ALLOC_BLOCK_TYPE_TREES* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_ALLOC_BLOCK_TYPE_TREES".}: cint
  BROTLI_DECODER_ERROR_UNREACHABLE* {.importjs: "zlib.constants.BROTLI_DECODER_ERROR_UNREACHABLE".}: cint

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
  # brotliCompress(s, foo)
  # gzip(s, foo)
  deflate(s, foo)
  # deflateRaw(s, foo)
