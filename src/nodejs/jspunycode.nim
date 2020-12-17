
func importPunycode*() {.importjs: "import * as punycode from 'punycode'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requirePunycode*() {.importjs: "const punycode = require('punycode')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func decode*(stringy: cstring): cstring {.importjs: "punycode.$1(#)".}
  ## https://nodejs.org/api/punycode.html#punycode_punycode_decode_string

func encode*(stringy: cstring): cstring {.importjs: "punycode.$1(#)".}
  ## https://nodejs.org/api/punycode.html#punycode_punycode_encode_string

func toASCII*(stringy: cstring): cstring {.importjs: "punycode.$1(#)".}
  ## https://nodejs.org/api/punycode.html#punycode_punycode_toascii_domain

func toUnicode*(stringy: cstring): cstring {.importjs: "punycode.$1(#)".}
  ## https://nodejs.org/api/punycode.html#punycode_punycode_tounicode_domain

func ucs2Decode*(stringy: cstring): seq[cint] {.importjs: "punycode.ucs2.decode(#)".}
  ## https://nodejs.org/api/punycode.html#punycode_punycode_ucs2_decode_string

func ucs2Encode*(codePoints: openArray[cint]): cstring {.importjs: "punycode.ucs2.encode(#)".}
  ## https://nodejs.org/api/punycode.html#punycode_punycode_ucs2_encode_codepoints


runnableExamples:
  requirePunycode()
  const str = "hello".cstring
  echo decode(str)
  echo encode(str)
  echo toASCII(str)
  echo toUnicode(str)
  echo ucs2Decode(str)
  echo ucs2Encode([0.cint, 1, 2, 3, 4, 5, 6, 7, 8, 9])
