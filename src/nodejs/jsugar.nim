## * Syntax sugar and convenience functions for JavaScript.
import jsffi
export jsffi

const
  arrow* = "const $2 = ($3) =>".cstring      ## Arrow Function for Nim functions, use `{.codegenDecl: arrow.}`.
  maxValidDate* = "8640000000000000".cstring  ## `new Date(8640000000000001)`  "Invalid Date". (Same as `Math.pow(10, 8) * 24 * 60 * 60 * 1000`)
  minValidDate* = "-8640000000000000".cstring ## `new Date(-8640000000000001)` "Invalid Date". (Same as `-maxValidDate`)

func `&`*(a, b: cstring): cstring {.importjs: "(# + #)".}

func `&`*(a: cstring, b: char): cstring {.importjs: "(# + String.fromCharCode(#))".}

func `&`*(a: char, b: cstring): cstring {.importjs: "(String.fromCharCode(#) + #)".}

func strip*(s: cstring): cstring {.importjs: "#.trim()".}

func startsWith*(a, b: cstring): bool {.importjs: "#.startsWith(#)".}

func endsWith*(a, b: cstring): bool {.importjs: "#.endsWith(#)".}

proc parseInt*(s: cstring): cint {.importjs: "parseInt(#, 10)".}

proc parseInt*(s: char): cint {.importjs: "parseInt(String.fromCharCode(#), 10)".}

proc parseUInt*(s: cstring): uint {.importjs: "parseInt(#, 10)".}

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

func uuid1validate*(uuidv1: cstring): bool {.importjs: """
  (() => {
    const UUID_RE1 = new RegExp("^[0-9a-f]{8}-[0-9a-f]{4}-1[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$$", "i");
    return UUID_RE1.test(#);
  })()""".}
  ## Convenience func to validate 1 UUID v1 string.

func uuid4validate*(uuidv4: cstring): bool {.importjs: """
  (() => {
    const UUID_RE4 = new RegExp("^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$$", "i");
    return UUID_RE4.test(#);
  })()""".}
  ## Convenience func to validate 1 UUID v4 string.

func uuid5validate*(uuidv5: cstring): bool {.importjs: """
  (() => {
    const UUID_RE5 = /^[0-9a-f]{8}-[0-9a-f]{4}-[5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$$/i;
    return UUID_RE5.test(#);
  })()""".}
  ## Convenience func to validate 1 UUID v5 string.

func base64encode*(strng: cstring; encoding = "utf-8".cstring): cstring {.importjs: "Buffer.from(#, #).toString('base64')".}
  ## Convenience func to Base64 encode a string.

func base64decode*(strng: cstring; encoding = "utf-8".cstring): cstring {.importjs: "Buffer.from(#, 'base64').toString(#)".}
  ## Convenience func to Base64 decode a string.

func deduplicate*[T](arrai: openArray[T]): seq[T] {.importjs: "[...new Set(#)]".}
  ## Convenience func to Deduplicate an array.

func shuffle*(arrai: openArray[any]): seq[any] {.importjs: "#.sort(() => { return Math.random() - 0.5})".}
  ## Convenience func to Random shuffle an array.

func generate2FAcode*(): cint {.importjs: "parseInt(Math.floor(Math.random() * 1000000).toString().padStart(6, '0'))".}
  ## Convenience func to generate a valid 2 Factor Authentication code integer.

func nextDays*(days = 7.cint): seq[JsObject] {.importjs: "[...Array(#).keys()].map(days => new Date(Date.now() + 86400000 * days))".}
  ## Convenience func to create an seq of the next days, inclusive.

func pastDays*(days = 7.cint): seq[JsObject] {.importjs: "[...Array(#).keys()].map(days => new Date(Date.now() - 86400000 * days))".}
  ## Convenience func to create an seq of the past days, inclusive.

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

func sparkline*(numbers: openarray[cint]; minimum: cint; maximum: cint): cstring {.asmnostackframe.} = {.emit: """
  const ticks = ['▁', '▂', '▃', '▄', '▅', '▆', '▇', '█'];
  if (`minimum` === `maximum` && `maximum` !== 0) {
    ticks = [ticks[4]];
  };
  return `numbers`.map(number => {
    if (!Number.isFinite(number)) {
      return ' ';
    };
    let tickIndex = Math.ceil((number / `maximum`) * ticks.length) - 1;
    if (`maximum` === 0 || tickIndex < 0) {
      tickIndex = 0;
    };
    return ticks[tickIndex];
  }).join('');""".}
  ## Convenience func to generate "Sparklines" loading spinners from numbers.

template iife*(code: untyped): untyped =
  ## Convenience template for Anonymous Immediately Invoked Function Expressions.
  {.emit: "(() => {".}
  code
  {.emit: "})();".}

template jsconst*(name: untyped; value: any): untyped =
  ## Convenience template for a JavaScript `const` (Nim `var`).
  var name {.codegenDecl: "const $2", exportc: astToStr(name).} = value

func jsexport*(symbols: any) {.importjs: "export { @ }", varargs.}
  ## Convenience alias for `export { symbol, symbol, symbol };`

func nth*(someOrdinalInteger: cint): cstring {.importjs: """
  (() => {
    const n = #;
    if (/^(string|number)$$/.test(typeof n) === false) { return n; }
    let suffixes = ['th', 'st', 'nd', 'rd', 'th', 'th', 'th', 'th', 'th', 'th'], match = n.toString().match(/\d$$/), suffix;
    if (!match) { return n; }
    suffix = suffixes[match[0]];
    if (/1[123]$$/.test(n)) { suffix = 'th'; }
    return n + suffix;
  })()""".}
  ## Convenience func to get string ordinal suffixes from integers (`"1st"`, `"2nd"`, `"3rd"`, etc).

func toRGB*(color: cstring): array[3, cint] {.importjs: """
  (() => { const n = parseInt(#, 16); return [n >> 16, n >> 8 & 255, n & 255] })()""".}
  ## Convenience func to convert a 6 digit Hexadecimal string value to an RGB integer array.

func toHex*(color: array[3, cint]): cstring {.importjs: """
  (() => { const n = #; return ((n[2] | n[1] << 8 | n[0] << 16) | 1 << 24).toString(16).slice(1); })()""".}
  ## Convenience func to convert a RGB integer array to 6 digit Hexadecimal string.

func `|>`(leftSide: any, rightSide: any) {.importjs: "(# |> #)".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Pipeline_operator

func `?.`(leftSide: any, rightSide: any) {.importjs: "#?.#".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining


runnableExamples:
  import sugar  # =>
  doAssert base64encode("Como siempre: lo urgente no deja tiempo para lo importante".cstring) == "Q29tbyBzaWVtcHJlOiBsbyB1cmdlbnRlIG5vIGRlamEgdGllbXBvIHBhcmEgbG8gaW1wb3J0YW50ZQ==".cstring
  doAssert base64decode("Q29tbyBzaWVtcHJlOiBsbyB1cmdlbnRlIG5vIGRlamEgdGllbXBvIHBhcmEgbG8gaW1wb3J0YW50ZQ==".cstring) == "Como siempre: lo urgente no deja tiempo para lo importante".cstring
  doAssert generate2FAcode() is cint
  doAssert deduplicate([9, 1, 2, 3, 4, 9, 9, 9, 0]) == @[9, 1, 2, 3, 4, 0]
  doAssert deduplicate(@[9, 9, 9, 9]) == @[9]
  doAssert not uuid1validate("".cstring)
  doAssert not uuid4validate("".cstring)
  doAssert not uuid5validate("".cstring)
  doAssert uuid1validate("e64cb2a6-3ff6-11eb-b378-0242ac130002".cstring)
  doAssert uuid4validate("854fc25b-02f3-45cc-b521-516991b9bb99".cstring)
  doAssert nextDays() is seq[JsObject]
  doAssert pastDays() is seq[JsObject]

  discard sparkline([1.cint, 2, 3, 4, 5], minimum = 0.cint, maximum = 10.cint)

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

  iife:
    # (() => {
    echo "Hello Immediately Invoked Function Expressions"
    # })();

  jsconst constant, "This is a JavaScript 'const'!.".cstring
  # const constant = "This is a JavaScript 'const'!.";

  proc example(argument0, argument1: int) {.codegenDecl: arrow.} =
    # const example = (argument0, argument1) => {
    echo "JavaScript Arrow Function for Nim functions"
    # }

  example2(arg0, arg1: int) {.codegenDecl: arrow.} => echo "JavaScript Arrow Function for Nim Arrow Functions"
  # const example2 = (arg0, arg01) => { echo("JavaScript Arrow Function for Nim functions") };

  doAssert nth(-9.cint) == "-9th".cstring
  doAssert nth(0.cint) == "0th".cstring
  doAssert nth(9.cint) == "9th".cstring
  doAssert nth(1.cint) == "1st".cstring
  doAssert nth(42.cint) == "42nd".cstring
  doAssert nth(420.cint) == "420th".cstring
  doAssert nth(666.cint) == "666th".cstring

  doAssert toRGB("c0ffee".cstring) == [192.cint, 255, 238]
  doAssert toHex([192.cint, 255, 238]) == "c0ffee".cstring

  when off:
    jsexport constant, example, example2
    # export { constant, example, example2 };
