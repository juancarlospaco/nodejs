import std/jsffi
from std/jsbigints import JsBigInt

type Buffer* = ref object of JsRoot  ## https://nodejs.org/api/buffer.html#buffer_buffer
  len* {.importjs: "length".}: cint
  poolSize* {.importjs.}: cint    ## https://nodejs.org/api/buffer.html#buffer_class_property_buffer_poolsize
  byteOffset* {.importjs.}: cint  ## https://nodejs.org/api/buffer.html#buffer_buf_byteoffset

let
  INSPECT_MAX_BYTES* {.importjs: "buffer.INSPECT_MAX_BYTES".}: cint
  kMaxLength* {.importjs: "buffer.kMaxLength".}: cint
  bufferMAX_LENGTH* {.importjs: "buffer.constants.MAX_LENGTH".}: cint
  bufferMAX_STRING_LENGTH* {.importjs: "buffer.constants.MAX_STRING_LENGTH".}: cint

func importBuffer*() {.importjs: "import * as buffer from 'buffer'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireBuffer*() {.importjs: "const buffer = require('buffer')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func newBuffer*(arrai: openArray[SomeInteger] or Buffer): Buffer {.importjs: "(new Buffer(#))".}
  ## https://nodejs.org/api/buffer.html#buffer_new_buffer_array

func newBuffer*(str: cstring; encoding = "utf8".cstring): Buffer {.importjs: "(new Buffer(#, #))".}
  ## https://nodejs.org/api/buffer.html#buffer_new_buffer_string_encoding

func newBuffer*(size: SomeInteger): Buffer {.importjs: "(new Buffer(#))".}
  ## https://nodejs.org/api/buffer.html#buffer_new_buffer_size

func newBuffer*(size: SomeInteger; fill: cstring or int or Buffer = 0; encoding = "utf8".cstring): Buffer {.importjs: "Buffer.alloc(#, #, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_static_method_buffer_alloc_size_fill_encoding

func unsafeNewBuffer*(size: int): Buffer {.importjs: "Buffer.allocUnsafe(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_static_method_buffer_allocunsafe_size

func unsafeSlowNewBuffer*(size: int): Buffer {.importjs: "Buffer.allocUnsafeSlow(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_static_method_buffer_allocunsafeslow_size

func newBuffer*(objec: JsObject): Buffer {.importjs: "Buffer.from(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_static_method_buffer_from_object_offsetorencoding_length

func fill*(self: Buffer; value: cstring or Buffer or int; offset: int; ends: int; encoding = "utf8".cstring): Buffer {.importjs: "#.$1(#, #, #, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_fill_value_offset_end_encoding

func byteLength*(self: Buffer; encoding = "utf8".cstring): int {.importjs: "Buffer.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_static_method_buffer_bytelength_string_encoding

func compare*(self: Buffer; other: Buffer): int {.importjs: "Buffer.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_static_method_buffer_compare_buf1_buf2

func compare*(self: Buffer; other: Buffer; targetStart, targetEnd, sourceStart, sourceEnd: int): int {.importjs: "#.$1(#, #, #, #, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_compare_target_targetstart_targetend_sourcestart_sourceend

func compare*(self: Buffer; other: Buffer; targetStart, sourceStart, sourceEnd: int): int {.importjs: "#.$1(#, #, #, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_copy_target_targetstart_sourcestart_sourceend

func concat*(list: openArray[Buffer]): Buffer {.importjs: "Buffer.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_static_method_buffer_concat_list_totallength

func isBuffer*(objec: JsObject): bool {.importjs: "Buffer.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_static_method_buffer_concat_list_totallength

func isEncoding*(encoding: cstring): bool {.importjs: "Buffer.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_static_method_buffer_isencoding_encoding

func `[]`*(self: Buffer; index: int): byte {.importjs: "#[#]".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_index

func entries*(self: Buffer): seq[(int, byte)] {.importjs: "Array.from(#.entries())".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_entries

func keys*(self: Buffer): seq[int] {.importjs: "#.$1()".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_keys

func values*(self: Buffer): seq[byte] {.importjs: "#.$1()".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_values

func `==`*(self: Buffer; other: Buffer): bool {.importjs: "#.equals(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_equals_otherbuffer

func contains*(self: Buffer; value: cstring or Buffer or int; byteOffset = 0; encoding = "utf8".cstring): bool {.importjs: "#.$1(#, #, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_includes_value_byteoffset_encoding

func find*(self: Buffer; value: cstring or Buffer or int; byteOffset = 0; encoding = "utf8".cstring): int {.importjs: "#.indexOf(#, #, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_indexof_value_byteoffset_encoding

func lastIndexOf*(self: Buffer; value: cstring or Buffer or int; byteOffset = 0; encoding = "utf8".cstring): int {.importjs: "#.$1(#, #, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_lastindexof_value_byteoffset_encoding

func readBigInt64BE*(self: Buffer; offset = 0): JsBigInt {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readbigint64be_offset

func readBigInt64LE*(self: Buffer; offset = 0): JsBigInt {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readbigint64le_offset

func readBigUInt64BE*(self: Buffer; offset = 0): JsBigInt {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readbiguint64be_offset

func readBigUInt64LE*(self: Buffer; offset = 0): JsBigInt {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readbiguint64le_offset

func readDoubleBE*(self: Buffer; offset = 0): BiggestFloat {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readdoublebe_offset

func readDoubleLE*(self: Buffer; offset = 0): BiggestFloat {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readdoublele_offset

func readFloatBE*(self: Buffer; offset = 0): float32 {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readdoublele_offset

func readFloatLE*(self: Buffer; offset = 0): float32 {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readfloatle_offset

func readInt8*(self: Buffer; offset = 0): int8 {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readint8_offset

func readInt16BE*(self: Buffer; offset = 0): int16 {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readint16be_offset

func readInt16LE*(self: Buffer; offset = 0): int16 {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readint16le_offset

func readInt32BE*(self: Buffer; offset = 0): int32 {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readint32be_offset

func readInt32LE*(self: Buffer; offset = 0): int32 {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readint32le_offset

func readIntBE*(self: Buffer; offset: int; byteLength: int): cstring {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readintbe_offset_bytelength

func readIntLE*(self: Buffer; offset: int; byteLength: int): cstring {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readintle_offset_bytelength

func readUInt8*(self: Buffer; offset = 0): uint8 {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readuint8_offset

func readUInt16BE*(self: Buffer; offset = 0): uint16 {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readuint16be_offset

func readUInt16LE*(self: Buffer; offset = 0): uint16 {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readuint16le_offset

func readUInt32BE*(self: Buffer; offset = 0): uint32 {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readuint32be_offset

func readUInt32LE*(self: Buffer; offset = 0): uint32 {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readuint32le_offset

func readUIntBE*(self: Buffer; offset: int; byteLength: int): cstring {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readuintbe_offset_bytelength

func readUIntLE*(self: Buffer; offset: int; byteLength: int): cstring {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readuintle_offset_bytelength

func subarray*(self: Buffer; start: int; ends: int): Buffer {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_readuintle_offset_bytelength

func slice*(self: Buffer; start: int; ends: int): Buffer {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_slice_start_end

func swap16*(self: Buffer): Buffer {.importjs: "#.$1()".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_swap16

func swap32*(self: Buffer): Buffer {.importjs: "#.$1()".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_swap32

func swap64*(self: Buffer): Buffer {.importjs: "#.$1()".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_swap64

func toJSON*(self: Buffer): JsObject {.importjs: "#.$1()".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_tojson

func write*(self: Buffer; str: cstring; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_write_string_offset_length_encoding

func writeBigInt64BE*(self: Buffer; value: JsBigInt; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writebigint64be_value_offset

func writeBigInt64LE*(self: Buffer; value: JsBigInt; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writebigint64le_value_offset

func writeBigUInt64BE*(self: Buffer; value: JsBigInt; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writebiguint64be_value_offset

func writeBigUInt64LE*(self: Buffer; value: JsBigInt; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writebiguint64le_value_offset

func writeDoubleBE*(self: Buffer; value: BiggestFloat; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writedoublebe_value_offset

func writeDoubleLE*(self: Buffer; value: BiggestFloat; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writedoublele_value_offset

func writeFloatBE*(self: Buffer; value: float; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writefloatbe_value_offset

func writeFloatLE*(self: Buffer; value: float; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writefloatle_value_offset

func writeInt8*(self: Buffer; value: int8; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writeint8_value_offset

func writeInt16BE*(self: Buffer; value: int16; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writeint16be_value_offset

func writeInt16LE*(self: Buffer; value: int16; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writeint16le_value_offset

func writeInt32BE*(self: Buffer; value: int32; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writeint32be_value_offset

func writeInt32LE*(self: Buffer; value: int32; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writeint32le_value_offset

func writeIntBE*(self: Buffer; value: int; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writeintbe_value_offset_bytelength

func writeIntLE*(self: Buffer; value: int; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writeintle_value_offset_bytelength

func writeUInt8*(self: Buffer; value: uint8; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writeuint8_value_offset

func writeUInt16BE*(self: Buffer; value: uint16; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writeuint16be_value_offset

func writeUInt16LE*(self: Buffer; value: uint16; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writeuint16be_value_offset

func writeUInt32BE*(self: Buffer; value: uint32; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writeuint16be_value_offset

func writeUInt32LE*(self: Buffer; value: uint32; offset = 0): int {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writeuint32le_value_offset

func writeUIntBE*(self: Buffer; value: SomeUnsignedInt; offset: int; byteLength: int): int {.importjs: "#.$1(#, #, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writeuintbe_value_offset_bytelength

func writeUIntLE*(self: Buffer; value: SomeUnsignedInt; offset: int; byteLength: int): int {.importjs: "#.$1(#, #, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_writeuintle_value_offset_bytelength

func atob*(self: Buffer; value: auto): Buffer {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buffer_atob_data

func btoa*(self: Buffer; value: auto): Buffer {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/buffer.html#buffer_buffer_btoa_data

func transcode*(self: Buffer; fromEnc: cstring; toEnc: cstring): Buffer {.importjs: "buffer.$1(#, #, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buffer_transcode_source_fromenc_toenc

func toCstring*(self: Buffer; encoding = "utf8".cstring; start = 0): cstring {.importjs: "#.toString(#, #)".}
  ## https://nodejs.org/api/buffer.html#buffer_buf_tostring_encoding_start_end

func `$`*(self: Buffer): string =
  $self.toCstring()
