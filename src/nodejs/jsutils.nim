## NodeJS Standard Library for Nim for JavaScript Target https://nodejs.org/api/util.html
when not defined(js) and not defined(nimdoc): 
  {.fatal: "Module is designed to be used with the JavaScript backend.".}

func importNodeUtil*() {.importjs: "import * as node_util from 'util'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireNodeUtil*() {.importjs: "const node_util = require('util')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func callbackify*(original: proc): any {.importjs: "node_util.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_callbackify_original

func deprecate*(fn: proc; msg: cstring; code = "".cstring): any {.importjs: "node_util.$1(#, #, #)".}
  ## https://nodejs.org/api/util.html#util_util_deprecate_fn_msg_code

func format*(format: cstring; args: cstring): cstring {.importjs: "node_util.$1(#, @)", varargs.}
  ## https://nodejs.org/api/util.html#util_util_format_format_args

func getSystemErrorName*(err: cint): cstring {.importjs: "node_util.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_getsystemerrorname_err

func inherits*(constructor, superConstructor: proc) {.importjs: "node_util.$1(#, #)".}
  ## https://nodejs.org/api/util.html#util_util_inherits_constructor_superconstructor

func inspect*(objec: any; showHidden = false; depth = 2.cint; colors = false) {.importjs: "node_util.$1(#, #, #, #)".}
  ## https://nodejs.org/api/util.html#util_util_inspect_object_showhidden_depth_colors

func isDeepStrictEqual*(val1, val2: any): bool {.importjs: "node_util.$1(#, #)".}
  ## https://nodejs.org/api/util.html#util_util_isdeepstrictequal_val1_val2

func isAnyArrayBuffer*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isanyarraybuffer_value

func isArrayBufferView*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isarraybufferview_value

func isArgumentsObject*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isargumentsobject_value

func isArrayBuffer*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isarraybuffer_value

func isAsyncFunction*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isasyncfunction_value

func isBigInt64Array*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isbigint64array_value

func isBigUint64Array*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isbiguint64array_value

func isBooleanObject*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isbooleanobject_value

func isBoxedPrimitive*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isboxedprimitive_value

func isDataView*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isdataview_value

func isDate*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isdate_value

func isExternal*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isexternal_value

func isFloat32Array*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isfloat32array_value

func isFloat64Array*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isfloat64array_value

func isGeneratorFunction*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isgeneratorfunction_value

func isGeneratorObject*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isgeneratorobject_value

func isInt8Array*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isint8array_value

func isInt16Array*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isint16array_value

func isInt32Array*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isint32array_value

func isMap*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_ismap_value

func isMapIterator*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_ismapiterator_value

func isModuleNamespaceObject*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_ismodulenamespaceobject_value

func isNativeError*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isnativeerror_value

func isNumberObject*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isnumberobject_value

func isPromise*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_ispromise_value

func isProxy*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isproxy_value

func isRegExp*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isregexp_value

func isSet*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isset_value

func isSetIterator*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_issetiterator_value

func isSharedArrayBuffer*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_issharedarraybuffer_value

func isStringObject*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isstringobject_value

func isSymbolObject*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_issymbolobject_value

func isTypedArray*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_istypedarray_value

func isUint8Array*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isuint8array_value

func isUint8ClampedArray*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isuint8clampedarray_value

func isUint16Array*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isuint16array_value

func isUint32Array*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isuint32array_value

func isWeakMap*(value: any): bool {.importjs: "node_util.types.$1(#)".}
  ## https://nodejs.org/api/util.html#util_util_types_isweakmap_value

func isWeakSet*(value: any): bool {.importjs: "node_util.types.$1(#)".}
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
