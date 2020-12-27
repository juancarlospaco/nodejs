## * Core, primitives, basic proc, string basics, for JavaScript.
import jsffi
export jsffi

func `&`*(a, b: cstring): cstring {.importjs: "(# + #)".}

func `&`*(a: cstring, b: char): cstring {.importjs: "(# + String.fromCharCode(#))".}

func `&`*(a: char, b: cstring): cstring {.importjs: "(String.fromCharCode(#) + #)".}

func strip*(s: cstring): cstring {.importjs: "#.trim()".}

func startsWith*(a, b: cstring): bool {.importjs: "#.startsWith(#)".}

func endsWith*(a, b: cstring): bool {.importjs: "#.endsWith(#)".}

proc parseInt*(s: cstring): cint {.importjs: "parseInt(#, 10)".}

proc parseInt*(s: char): cint {.importjs: "parseInt(String.fromCharCode(#), 10)".}

proc parseUInt*(s: cstring): uint {.importjs: "parseInt(#, 10)".}

proc parseUInt*(s: char): uint {.importjs: "parseInt(String.fromCharCode(#), 10)".}

proc parseFloat*(s: cstring): BiggestFloat {.importjs: "parseFloat(#)".}

func contains*(a, b: cstring): bool {.importjs: "(#.indexOf(#) >= 0)".}

func contains*(a: cstring, b: char): bool {.importjs: "(#.indexOf(String.fromCharCode(#)) >= 0)".}

func isDigit*(c: char): bool {.importjs: "(() => { const c = #; return (c >= '0' && c <= '9') })()".}

func capitalizeAscii*(s: cstring): cstring {.importjs: """
  (() => { const s = #; return s.charAt(0).toUpperCase() + s.slice(1) })()""".}

func repeat*(s: cstring; n: Natural): cstring {.importjs: """
  (() => { const s = #; const n = #; return n < 1 ? '' : new Array(n + 1).join(s) })()""".}

func repeat*(s: char; n: Natural): cstring {.importjs: """
  (() => { const s = String.fromCharCode(#); const n = #; return n < 1 ? '' : new Array(n + 1).join(s) })()""".}

func find*(s: cstring; ss: cstring): int {.importjs: "#.indexOf(#)".}

func find*(s: cstring; ss: char): int {.importjs: "#.indexOf(String.fromCharCode(#))".}

func split*(a: cstring, b: cstring): seq[cstring] {.importjs: "#.split(#)".}

func split*(a: cstring, b: char): seq[cstring] {.importjs: "#.split(String.fromCharCode(#))".}

func toLowerAscii*(s: cstring): cstring {.importjs: "#.toLowerCase()".}

func toLowerAscii*(c: char): cstring {.importjs: "String.fromCharCode(#).toLowerCase()".}

func toUpperAscii*(s: cstring): cstring {.importjs: "#.toUpperCase()".}

func toUpperAscii*(c: char): cstring {.importjs: "String.fromCharCode(#).toUpperCase()".}

func replace*(s, sub: cstring, by = "".cstring): cstring {.importjs: "#.replace(#, #)".}

func replace*(s: cstring, sub: char, by = "".cstring): cstring {.importjs: "#.replace(String.fromCharCode(#), #)".}

func replace*(s: cstring, sub: char, by: char): cstring {.importjs: "#.replace(String.fromCharCode(#), String.fromCharCode(#))".}

func slice*(s: cstring; start: cint, ends: cint): cstring {.importjs: "#.slice(#, #)".}

func indentation*(s: cstring): cint {.importjs: """
  (() => {
    const m = #.match(/^[\s\\t]*/gm);
    let result = m[0].length;
    for (var i = 1; i < m.length; i++) { result = Math.min(m[i].length, result) }
    return result;
  })()""".}
  ## Returns the amount of indentation all lines of `s` have in common, ignoring lines that consist only of whitespace.

proc `[]`*(s: cstring; slice: HSlice[SomeInteger, SomeInteger]): cstring {.asmnostackframe.} =
  let start {.codegenDecl: "const $2".} = slice.a.int
  let ends {.codegenDecl: "const $2".} = slice.b.int + 1
  assert start >= 0, "Index out of bounds: " & $start
  assert ends > s.len, "Index out of bounds: " & $ends
  asm "return `s`.slice(`start`, `ends`);"

proc `[]`*(s: cstring; slice: HSlice[SomeInteger, BackwardsIndex]): cstring {.asmnostackframe.} =
  let start {.codegenDecl: "const $2".} = slice.a.int
  let ends {.codegenDecl: "const $2".} = s.len - slice.b.int + 1
  assert start >= 0, "Index out of bounds: " & $start
  assert ends > s.len, "Index out of bounds: " & $ends
  asm "return `s`.slice(`start`, `ends`);"

func base64encode*(strng: cstring; encoding = "utf-8".cstring): cstring {.importjs: "Buffer.from(#, #).toString('base64')".}
  ## Convenience func to Base64 encode a string.

func base64decode*(strng: cstring; encoding = "utf-8".cstring): cstring {.importjs: "Buffer.from(#, 'base64').toString(#)".}
  ## Convenience func to Base64 decode a string.

func deduplicate*[T](arrai: openArray[T]): seq[T] {.importjs: "[...new Set(#)]".}
  ## Convenience func to Deduplicate an array.

func shuffle*(arrai: openArray[any]): seq[any] {.importjs: "#.sort(() => { return Math.random() - 0.5})".}
  ## Convenience func to Random shuffle an array.

func parseBool*(s: cstring): bool {.asmnostackframe.} = {.emit: """
  const value = String(`s`).trim();
  if (/^(?:y|Y|1| ON|On|oN|on|yes|YES|YEs|YeS|Yes|yES|yEs|yeS|TRUE|TRUe|TRuE|TRue|TrUE|TrUe|TruE|True|tRUE|tRUe|tRuE|tRue|trUE|trUe|truE|true)$/i.test(value)) {
    return true;
  };
  if (/^(?:n|N|0|NO|No|nO|no|OFF|OFf|OfF|Off|oFF|oFf|ofF|off|FALSE|FALSe|FALsE|FALse|FAlSE|FAlSe|FAlsE|FAlse|FaLSE|FaLSe|FaLsE|FaLse|FalSE|FalSe|FalsE|False|fALSE|fALSe|fALsE|fALse|fAlSE|fAlSe|fAlsE|fAlse|faLSE|faLSe|faLsE|faLse|falSE|falSe|falsE|false)$/i.test(value)) {
    return false;
  };
  assert(false, "Cannot interpret as a bool");""".}
  ## Convenience func mimics Nim `parseBool` but optimized for NodeJS.
  ## Does NOT ignore `'_'`, if you need to ignore `'_'` use stdlib or remove the `'_'`.


runnableExamples:
  import sugar  # =>
  doAssert base64encode("Como siempre: lo urgente no deja tiempo para lo importante".cstring) == "Q29tbyBzaWVtcHJlOiBsbyB1cmdlbnRlIG5vIGRlamEgdGllbXBvIHBhcmEgbG8gaW1wb3J0YW50ZQ==".cstring
  doAssert base64decode("Q29tbyBzaWVtcHJlOiBsbyB1cmdlbnRlIG5vIGRlamEgdGllbXBvIHBhcmEgbG8gaW1wb3J0YW50ZQ==".cstring) == "Como siempre: lo urgente no deja tiempo para lo importante".cstring
  doAssert deduplicate([9, 1, 2, 3, 4, 9, 9, 9, 0]) == @[9, 1, 2, 3, 4, 0]
  doAssert deduplicate(@[9, 9, 9, 9]) == @[9]

  for okis in ["y".cstring, "Y", "1",  "ON", "On", "oN", "on", "yes", "YES",
      "YEs", "YeS", "Yes", "yES", "yEs", "yeS", "TRUE", "TRUe", "TRuE", "TRue",
      "TrUE", "TrUe", "TruE", "True", "tRUE", "tRUe", "tRuE", "tRue", "trUE",
      "trUe", "truE", "true"]:
      doAssert parseBool(okis)

  for nope in ["n".cstring, "N", "0", "NO", "No", "nO", "no", "OFF", "OFf",
    "OfF", "Off", "oFF", "oFf", "ofF", "off", "FALSE", "FALSe", "FALsE",
    "FALse", "FAlSE", "FAlSe", "FAlsE", "FAlse", "FaLSE", "FaLSe", "FaLsE",
    "FaLse", "FalSE", "FalSe", "FalsE", "False", "fALSE", "fALSe", "fALsE",
    "fALse", "fAlSE", "fAlSe", "fAlsE", "fAlse", "faLSE", "faLSe", "faLsE",
    "faLse", "falSE", "falSe", "falsE", "false"]:
    doAssert not parseBool(nope)

  let exampl = "hello"
  doAssert exampl[0] == 'h'
  doAssert exampl[0 .. 3] == "hell".cstring
  doAssert exampl[0 .. ^2] == "hell".cstring
