
func importPunycode*() {.importjs: "import * as punycode from 'punycode'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requirePunycode*() {.importjs: "const punycode = require('punycode')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func decode*(str: cstring): cstring {.importjs: "punycode.$1(#)".}
  ## https://nodejs.org/api/punycode.html#punycode_punycode_decode_string

func encode*(str: cstring): cstring {.importjs: "punycode.$1(#)".}
  ## https://nodejs.org/api/punycode.html#punycode_punycode_encode_string

func toASCII*(str: cstring): cstring {.importjs: "punycode.$1(#)".}
  ## https://nodejs.org/api/punycode.html#punycode_punycode_toascii_domain

func toUnicode*(str: cstring): cstring {.importjs: "punycode.$1(#)".}
  ## https://nodejs.org/api/punycode.html#punycode_punycode_tounicode_domain

func ucs2Decode*(str: cstring): seq[cint] {.importjs: "punycode.ucs2.decode(#)".}
  ## https://nodejs.org/api/punycode.html#punycode_punycode_ucs2_decode_string

func ucs2Encode*(codePoints: openArray[cint]): cstring {.importjs: "punycode.ucs2.encode(#)".}
  ## https://nodejs.org/api/punycode.html#punycode_punycode_ucs2_encode_codepoints
