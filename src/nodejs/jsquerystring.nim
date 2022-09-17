from std/jsffi import JsObject

func importQuerystring*() {.importjs: "import * as querystring from 'querystring'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireQuerystring*() {.importjs: "const querystring = require('querystring')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func escape*(stringy: cstring): cstring {.importjs: "(querystring.$1(#) || '')".}
  ## https://nodejs.org/api/querystring.html#querystring_querystring_escape_str

func unescape*(stringy: cstring): cstring {.importjs: "(querystring.$1(#) || '')".}
  ## https://nodejs.org/api/querystring.html#querystring_querystring_unescape_str

func parse*(str: cstring; sep = "&".cstring; eq = "=".cstring; maxKeys = 1000.cint): JsObject {.importjs: "(querystring.$1(#, #, #, {maxKeys: #}) || {})".}
  ## https://nodejs.org/api/querystring.html#querystring_querystring_parse_str_sep_eq_options

func stringify*(obj: JsObject; sep = "&".cstring; eq = "=".cstring): cstring {.importjs: "(querystring.$1(#, #, #) || '')".}
  ## https://nodejs.org/api/querystring.html#querystring_querystring_stringify_obj_sep_eq_options


runnableExamples:
  requireQuerystring()
  doAssert unescape("Archaean%20horizon%2C%20the%20first%20sunrise%2C%20on%20a%20pristine%20gaea%2C%20opus%20perfectum%2C%20somewhere%20there%2C%20us%20sleeping".cstring) == "Archaean horizon, the first sunrise, on a pristine gaea, opus perfectum, somewhere there, us sleeping".cstring
  doAssert escape("Come surf the clouds, race the dark, it feeds from the runs undone, meet me where the cliff greets the sea".cstring) == "Come%20surf%20the%20clouds%2C%20race%20the%20dark%2C%20it%20feeds%20from%20the%20runs%20undone%2C%20meet%20me%20where%20the%20cliff%20greets%20the%20sea".cstring
  doAssert stringify(parse("w=%D6%D0%CE%C4&foo=bar".cstring)) == "w=%EF%BF%BD%EF%BF%BD%EF%BF%BD%EF%BF%BD&foo=bar".cstring
