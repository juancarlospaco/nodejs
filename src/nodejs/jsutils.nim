
func importUtil*() {.importjs: "import * as util from 'util'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireUtil*() {.importjs: "const util = require('util')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

# proc callbackify*[T: proc](original: T ): any {.importjs: "util.$1(#)".}
#  https://nodejs.org/api/util.html#util_util_callbackify_original

# func deprecate*(fn: proc; msg: cstring; code = "".cstring): any {.importjs: "util.$1(#, #, #)".}
#  https://nodejs.org/api/util.html#util_util_deprecate_fn_msg_code

func format*(format: cstring; args: cstring): cstring {.importjs: "util.$1(#, @)", varargs.}
  ## https://nodejs.org/api/util.html#util_util_format_format_args

func getSystemErrorName*(err: cint): cstring {.importjs: "util.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_getsystemerrorname_err

# func inherits*(constructor, superConstructor: proc) {.importjs: "util.$1(#, #)".}
#  ## https://nodejs.org/api/util.html#util_util_inherits_constructor_superconstructor

func inspect*(objec: any; showHidden = false; depth = 2.cint; colors = false) {.importjs: "util.$1(#, #, #, #)".}
  ## https://nodejs.org/api/util.html#util_util_inspect_object_showhidden_depth_colors

func isDeepStrictEqual*(val1, val2: any): bool {.importjs: "util.$1(#, #)".}
  ## https://nodejs.org/api/util.html#util_util_isdeepstrictequal_val1_val2

func isAnyArrayBuffer*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isanyarraybuffer_value

func isArrayBufferView*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isarraybufferview_value

func isArgumentsObject*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isargumentsobject_value

func isArrayBuffer*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isarraybuffer_value

func isAsyncFunction*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isasyncfunction_value

func isBigInt64Array*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isbigint64array_value

func isBigUint64Array*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isbiguint64array_value

func isBooleanObject*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isbooleanobject_value

func isBoxedPrimitive*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isboxedprimitive_value

func isDataView*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isdataview_value

func isDate*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isdate_value

func isExternal*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isexternal_value

func isFloat32Array*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isfloat32array_value

func isFloat64Array*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isfloat64array_value

func isGeneratorFunction*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isgeneratorfunction_value

func isGeneratorObject*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isgeneratorobject_value

func isInt8Array*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isint8array_value

func isInt16Array*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isint16array_value

func isInt32Array*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isint32array_value

func isMap*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_ismap_value

func isMapIterator*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_ismapiterator_value

func isModuleNamespaceObject*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_ismodulenamespaceobject_value

func isNativeError*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isnativeerror_value

func isNumberObject*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isnumberobject_value

func isPromise*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_ispromise_value

func isProxy*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isproxy_value

func isRegExp*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isregexp_value

func isSet*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isset_value

func isSetIterator*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_issetiterator_value

func isSharedArrayBuffer*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_issharedarraybuffer_value

func isStringObject*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isstringobject_value

func isSymbolObject*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_issymbolobject_value

func isTypedArray*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_istypedarray_value

func isUint8Array*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isuint8array_value

func isUint8ClampedArray*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isuint8clampedarray_value

func isUint16Array*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isuint16array_value

func isUint32Array*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isuint32array_value

func isWeakMap*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isweakmap_value

func isWeakSet*(value: any): bool {.importjs: "util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isweakset_value

func isWebAssemblyCompiledModule*(value: any): bool {.importjs: "(# instanceof WebAssembly.Module)".}
  ## https://nodejs.org/api/util.html#util_util_types_iswebassemblycompiledmodule_value

func isArray*(value: any): bool {.importjs: "Array.isArray(#)".}
  ## https://nodejs.org/api/util.html#util_util_isarray_object

func isBoolean*(value: any): bool {.importjs: "(typeof # === 'boolean')".}
  ## https://nodejs.org/api/util.html#util_util_isboolean_object

func isBuffer*(value: any): bool {.importjs: "Buffer.isBuffer(#)".}
  ## https://nodejs.org/api/util.html#util_util_isbuffer_object

func isFunction*(value: any): bool {.importjs: "(typeof # === 'function')".}
  ## https://nodejs.org/api/util.html#util_util_isfunction_object

func isNull*(value: any): bool {.importjs: "(# === null)".}
  ## https://nodejs.org/api/util.html#util_util_isnull_object

func isNumber*(value: any): bool {.importjs: "(typeof # === 'number')".}
  ## https://nodejs.org/api/util.html#util_util_isnumber_object

func isString*(value: any): bool {.importjs: "(typeof # === 'string')".}
  ## https://nodejs.org/api/util.html#util_util_isstring_object

func isSymbol*(value: any): bool {.importjs: "(typeof # === 'symbol')".}
  ## https://nodejs.org/api/util.html#util_util_issymbol_object

func isUndefined*(value: any): bool {.importjs: "(# === undefined)".}
  ## https://nodejs.org/api/util.html#util_util_isundefined_object


runnableExamples:
  requireUtil()
  doAssert cstring"%s:%s".format("example".cstring) == "example:%s".cstring
  doAssert getSystemErrorName(-1.cint) == "EPERM".cstring
  inspect("nim".cstring)
  doAssert isDeepStrictEqual(42.cint, 42.cint)
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
  doAssert isArray([1, 2, 3])
  doAssert isBoolean(false)
  doAssert not isBuffer(false)
  doAssert not isFunction(false)
  doAssert isNull(nil)
  doAssert not isNumber(false)
  doAssert isString("string".cstring)
  doAssert not isSymbol(false)
  doAssert not isUndefined(false)
