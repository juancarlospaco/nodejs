import std/jsffi
include jscore

type TextEncoder* = ref object of JsRoot ## https://nodejs.org/api/util.html#util_class_util_textencoder
  encoding*: cstring  ## https://nodejs.org/api/util.html#util_textencoder_encoding

func newTextEncoder*(): TextEncoder {.importjs: "(new util.TextEncoder(@))".}

func encode*(self: TextEncoder; input: cstring): seq[uint8] {.importcpp.}
  ## https://nodejs.org/api/util.html#util_textencoder_encode_input

func encodeInto*(self: TextEncoder; src: cstring; dest: Uint8Array): JsObject {.importcpp, discardable.}
  ## https://nodejs.org/api/util.html#util_textencoder_encodeinto_src_dest

func importUtil*() {.importjs: "import * as util from 'util'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireUtil*() {.importjs: "const util = require('util')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

proc callbackify*[T](function: T): T {.importjs: "util.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_callbackify_original

func deprecate*[T](function: T): T {.importjs: "util.$1(#, '')".}
  ## https://nodejs.org/api/util.html#util_util_deprecate_fn_msg_code

func deprecate*[T](function: T; msg: cstring): T {.importjs: "util.$1(#, #)".}
  ## https://nodejs.org/api/util.html#util_util_deprecate_fn_msg_code

func deprecate*[T](function: T; msg, code: cstring): T {.importjs: "util.$1(#, #, #)".}
  ## https://nodejs.org/api/util.html#util_util_deprecate_fn_msg_code

func format*(format: cstring; args: cstring): cstring {.importjs: "util.$1(#, @)", varargs.}
  ## https://nodejs.org/api/util.html#util_util_format_format_args

func getSystemErrorName*(err: cint): cstring {.importjs: "util.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_getsystemerrorname_err

func inherits*[T](constructor, superConstructor: T) {.importjs: "util.$1(#, #)".}
  ## https://nodejs.org/api/util.html#util_util_inherits_constructor_superconstructor

func inspect*(objec: auto; showHidden = false; depth = 2.cint; colors = false) {.importjs: "util.$1(#, #, #, #)".}
  ## https://nodejs.org/api/util.html#util_util_inspect_object_showhidden_depth_colors

func isDeepStrictEqual*(val1, val2: auto): bool {.importjs: "util.$1(#, #)".}
  ## https://nodejs.org/api/util.html#util_util_isdeepstrictequal_val1_val2

func isAnyArrayBuffer*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isanyarraybuffer_value

func isArrayBufferView*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isarraybufferview_value

func isArgumentsObject*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isargumentsobject_value

func isArrayBuffer*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isarraybuffer_value

func isAsyncFunction*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isasyncfunction_value

func isBigInt64Array*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isbigint64array_value

func isBigUint64Array*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isbiguint64array_value

func isBooleanObject*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isbooleanobject_value

func isBoxedPrimitive*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isboxedprimitive_value

func isDataView*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isdataview_value

func isDate*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isdate_value

func isExternal*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isexternal_value

func isFloat32Array*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isfloat32array_value

func isFloat64Array*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isfloat64array_value

func isGeneratorFunction*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isgeneratorfunction_value

func isGeneratorObject*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isgeneratorobject_value

func isInt8Array*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isint8array_value

func isInt16Array*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isint16array_value

func isInt32Array*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isint32array_value

func isMap*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_ismap_value

func isMapIterator*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_ismapiterator_value

func isModuleNamespaceObject*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_ismodulenamespaceobject_value

func isNativeError*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isnativeerror_value

func isNumberObject*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isnumberobject_value

func isPromise*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_ispromise_value

func isProxy*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isproxy_value

func isRegExp*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isregexp_value

func isSet*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isset_value

func isSetIterator*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_issetiterator_value

func isSharedArrayBuffer*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_issharedarraybuffer_value

func isStringObject*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isstringobject_value

func isSymbolObject*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_issymbolobject_value

func isTypedArray*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_istypedarray_value

func isUint8Array*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isuint8array_value

func isUint8ClampedArray*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isuint8clampedarray_value

func isUint16Array*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isuint16array_value

func isUint32Array*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isuint32array_value

func isWeakMap*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isweakmap_value

func isWeakSet*(value: auto): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isweakset_value

func isWebAssemblyCompiledModule*(value: auto): bool {.importjs: "(# instanceof WebAssembly.Module)".}
  ## https://nodejs.org/api/util.html#util_util_types_iswebassemblycompiledmodule_value

func isBoolean*(value: auto): bool {.importjs: "(typeof # === 'boolean')".}
  ## https://nodejs.org/api/util.html#util_util_isboolean_object

func isBuffer*(value: auto): bool {.importjs: "Buffer.isBuffer(#)".}
  ## https://nodejs.org/api/util.html#util_util_isbuffer_object

func isFunction*(value: auto): bool {.importjs: "(typeof # === 'function')".}
  ## https://nodejs.org/api/util.html#util_util_isfunction_object

func isNumber*(value: auto): bool {.importjs: "(typeof # === 'number')".}
  ## https://nodejs.org/api/util.html#util_util_isnumber_object

func isString*(value: auto): bool {.importjs: "(typeof # === 'string')".}
  ## https://nodejs.org/api/util.html#util_util_isstring_object

func isSymbol*(value: auto): bool {.importjs: "(typeof # === 'symbol')".}
  ## https://nodejs.org/api/util.html#util_util_issymbol_object


runnableExamples:
  requireUtil()
  block:
    doAssert cstring"%s:%s".format("example".cstring) == "example:%s".cstring
    doAssert getSystemErrorName(-1.cint) == "EPERM".cstring
    inspect("nim".cstring)
    proc foo() = echo 42
    discard callbackify(foo)
    discard deprecate(foo)
    doAssert isDeepStrictEqual(42.cint, 42.cint)
  block:
    let enco: TextEncoder = newTextEncoder()
    doAssert enco.encoding == "utf-8".cstring
    doAssert enco.encode(input = "example".cstring) == @[101.uint8, 120, 97, 109, 112, 108, 101]
    var buffe: Uint8Array = newUint8Array(9.Natural)
    enco.encodeInto(src = "example".cstring, dest = buffe)
    doAssert buffe.toCstring is cstring
    doAssert $buffe == """{"0":101,"1":120,"2":97,"3":109,"4":112,"5":108,"6":101,"7":0,"8":0}"""
  block:
    doAssert not isAnyArrayBuffer(false)
    doAssert not isArrayBufferView(false)
    doAssert not isArgumentsObject(false)
    doAssert not isArrayBuffer(false)
    doAssert not isBigInt64Array(false)
    doAssert not isBigUint64Array(false)
    doAssert not isBooleanObject(false)
    doAssert not isBoxedPrimitive(false)
    doAssert not isDataView(false)
    doAssert not isDate(false)
    doAssert not isExternal(false)
    doAssert not isFloat32Array(false)
    doAssert not isFloat64Array(false)
    doAssert not isGeneratorFunction(false)
    doAssert not isBigInt64Array(false)
    doAssert not isGeneratorObject(false)
    doAssert not isInt8Array(false)
    doAssert not isInt16Array(false)
    doAssert not isInt32Array(false)
    doAssert not isMap(false)
    doAssert not isMapIterator(false)
    doAssert not isModuleNamespaceObject(false)
    doAssert not isNativeError(false)
    doAssert not isNumberObject(false)
    doAssert not isPromise(false)
    doAssert not isProxy(false)
    doAssert not isRegExp(false)
    doAssert not isSet(false)
    doAssert not isSetIterator(false)
    doAssert not isSharedArrayBuffer(false)
    doAssert not isStringObject("string".cstring)
    doAssert not isSymbolObject(false)
    doAssert not isTypedArray(false)
    doAssert not isUint8Array(false)
    doAssert not isUint8ClampedArray(false)
    doAssert not isUint16Array(false)
    doAssert not isUint32Array(false)
    doAssert not isWeakMap(false)
    doAssert not isWeakSet(false)
    doAssert not isWebAssemblyCompiledModule(false)
    doAssert isBoolean(false)
    doAssert not isBuffer(false)
    doAssert not isFunction(false)
    doAssert not isNumber(false)
    doAssert isString("string".cstring)
    doAssert not isSymbol(false)
