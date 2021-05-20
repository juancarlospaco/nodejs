from std/jsffi import JsObject

type
  StreamWritable* {.importjs: "stream.Writable".} = ref object of JsRoot  ## https://nodejs.org/api/stream.html#stream_class_stream_writable
    destroyed*, writable*, writableEnded*, writableCorked*: bool
    writableFinished*, writableNeedDrain*, writableObjectMode*: bool
    writableHighWaterMark*, writableLength*: int

  StreamReadable* {.importjs: "stream.Readable".} = ref object of JsRoot  ## https://nodejs.org/api/stream.html#stream_class_stream_readable
    destroyed*, readable*, readableEnded*, readableFlowing*, readableObjectMode*: bool
    readableHighWaterMark*, readableLength*: int
    readableEncoding*: cstring

func importStream*() {.importjs: "import * as stream from 'stream'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireStream*() {.importjs: "const stream = require('stream')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func cork*(self: StreamWritable) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/stream.html#stream_writable_cork

func uncork*(self: StreamWritable) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/stream.html#stream_writable_uncork

func destroy*(self: StreamWritable or StreamReadable): StreamWritable {.importjs: "#.$1()".}
  ## https://nodejs.org/api/stream.html#stream_writable_destroy_error

func ends*(self: StreamWritable; chunk: auto; encoding = "utf-8".cstring): StreamWritable {.importjs: "#.end(#, #)".}
  ## https://nodejs.org/api/stream.html#stream_writable_end_chunk_encoding_callback

func ends*[T](self: StreamWritable; callback: T): StreamWritable {.importjs: "#.end(#)".}
  ## https://nodejs.org/api/stream.html#stream_writable_end_chunk_encoding_callback

func setDefaultEncoding*(self: StreamWritable; encoding: cstring): StreamWritable {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/stream.html#stream_writable_setdefaultencoding_encoding

func setEncoding*(self: StreamReadable; encoding: cstring): StreamReadable {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/stream.html#stream_readable_setencoding_encoding

func write*(self: StreamWritable; chunk: auto; encoding = "utf-8".cstring): bool {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/stream.html#stream_writable_write_chunk_encoding_callback

func write*[T](self: StreamWritable; callback: T): bool {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/stream.html#stream_writable_write_chunk_encoding_callback

func isPaused*(self: StreamReadable): bool {.importjs: "#.$1()".}
  ## https://nodejs.org/api/stream.html#stream_readable_ispaused

func pause*(self: StreamReadable): StreamReadable {.importjs: "#.$1()".}
  ## https://nodejs.org/api/stream.html#stream_readable_pause

func resume*(self: StreamReadable): StreamReadable {.importjs: "#.$1()".}
  ## https://nodejs.org/api/stream.html#stream_readable_resume

func pipe*(self: StreamReadable; destination: StreamWritable; ends = true): StreamWritable {.importjs: "#.$1(#, {end: #})".}
  ## https://nodejs.org/api/stream.html#stream_readable_pipe_destination_options

func unpipe*(self: StreamReadable; destination: StreamWritable): StreamReadable {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/stream.html#stream_readable_unpipe_destination

func read*(self: StreamReadable): auto {.importjs: "#.$1()".}
  ## https://nodejs.org/api/stream.html#stream_readable_read_size

func read*(self: StreamReadable; size: int): auto {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/stream.html#stream_readable_read_size

func unshift*(self: StreamReadable; chunk: auto; encoding = "utf-8".cstring) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/stream.html#stream_readable_unshift_chunk_encoding

func finished*(self: StreamReadable or StreamWritable): auto {.importjs: "stream.finished(#)".}
  ## https://nodejs.org/api/stream.html#stream_readable_unshift_chunk_encoding

func finished*[T](self: StreamReadable or StreamWritable; callback: T): auto {.importjs: "stream.finished(#, #)".}
  ## https://nodejs.org/api/stream.html#stream_readable_unshift_chunk_encoding

func pipeline*[T](self: StreamReadable; destination: StreamWritable; callback: T): auto {.importjs: "stream.pipeline(#, #, #)".}
  ## https://nodejs.org/api/stream.html#stream_readable_unshift_chunk_encoding

func pipeline*(self: StreamReadable; destination: StreamWritable): auto {.importjs: "stream.pipeline(#, #)".}
  ## https://nodejs.org/api/stream.html#stream_readable_unshift_chunk_encoding

func refresh*(self: StreamReadable) {.importjs: "#.read(0)", discardable.}
  ## https://nodejs.org/api/stream.html#stream_readable_read_0
