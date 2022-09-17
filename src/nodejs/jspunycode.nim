
func importPunycode*() {.importjs: "import * as punycode from 'punycode'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requirePunycode*() {.importjs: "const punycode = require('punycode')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func decode*(stringy: cstring): cstring {.importjs: "(punycode.$1(#) || '')".}
  ## https://nodejs.org/api/punycode.html#punycode_punycode_decode_string

func encode*(stringy: cstring): cstring {.importjs: "(punycode.$1(#) || '')".}
  ## https://nodejs.org/api/punycode.html#punycode_punycode_encode_string

func toASCII*(stringy: cstring): cstring {.importjs: "(punycode.$1(#) || '')".}
  ## https://nodejs.org/api/punycode.html#punycode_punycode_toascii_domain

func toUnicode*(stringy: cstring): cstring {.importjs: "(punycode.$1(#) || '')".}
  ## https://nodejs.org/api/punycode.html#punycode_punycode_tounicode_domain

func ucs2Decode*(stringy: cstring): seq[cint] {.importjs: "(punycode.ucs2.decode(#) || [])".}
  ## https://nodejs.org/api/punycode.html#punycode_punycode_ucs2_decode_string

func ucs2Encode*(codePoints: openArray[cint]): cstring {.importjs: "(punycode.ucs2.encode(#) || '')".}
  ## https://nodejs.org/api/punycode.html#punycode_punycode_ucs2_encode_codepoints


runnableExamples:
  requirePunycode()
  const str = "hello".cstring
  doAssert decode(str) == "㗁㖼㖶".cstring
  doAssert encode(str) == "hello-".cstring
  doAssert toASCII(str) == "hello".cstring
  doAssert toUnicode(str) == "hello".cstring
  doAssert ucs2Decode(str) == @[104.cint, 101, 108, 108, 111]
  doAssert ucs2Encode(@[104.cint, 101, 108, 108, 111]) == "hello".cstring
