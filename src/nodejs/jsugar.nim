## * Syntax sugar and convenience functions for JavaScript.
import std/jsffi
export jsffi

const
  arrow* = "const $2 = ($3) =>".cstring      ## Arrow Function for Nim functions, use `{.codegenDecl: arrow.}`.
  maxValidDate* = "8640000000000000".cstring  ## `new Date(8640000000000001)`  "Invalid Date". (Same as `Math.pow(10, 8) * 24 * 60 * 60 * 1000`)
  minValidDate* = "-8640000000000000".cstring ## `new Date(-8640000000000001)` "Invalid Date". (Same as `-maxValidDate`)

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

func generate2FAcode*(): cint {.importjs: "parseInt(Math.floor(Math.random() * 1000000).toString().padStart(6, '0'))".}
  ## Convenience func to generate a valid 2 Factor Authentication code integer.

func nextDays*(days = 7.cint): seq[JsObject] {.importjs: "[...Array(#).keys()].map(days => new Date(Date.now() + 86400000 * days))".}
  ## Convenience func to create an seq of the next days, inclusive.

func pastDays*(days = 7.cint): seq[JsObject] {.importjs: "[...Array(#).keys()].map(days => new Date(Date.now() - 86400000 * days))".}
  ## Convenience func to create an seq of the past days, inclusive.

func sparkline*(numbers: openArray[cint]; minimum: cint; maximum: cint): cstring {.asmNoStackFrame.} = {.emit: """
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

template `::=`*(name: untyped; value: auto): untyped =
  ## Convenience template for a JavaScript `const` (Nim `var`).
  ## Other libs already use `:=` then we use `::=`, because `:==` looks like a comparison.
  var name {.codegenDecl: "const $2", exportc: astToStr(name).} = value

func jsexport*(symbols: auto) {.importjs: "export { @ }", varargs.}
  ## Convenience alias for `export { symbol0, symbol1, symbol2 };`

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

func removeAccents*(s: cstring): cstring {.importjs: """(#
  .replace(/[\xC0-\xC5]/g, "A").replace(/[\xC6]/g, "AE").replace(/[\xC7]/g, "C")
  .replace(/[\xC8-\xCB]/g, "E").replace(/[\xCC-\xCF]/g, "I").replace(/[\xD0]/g, "D")
  .replace(/[\xD1]/g, "N").replace(/[\xD2-\xD6\xD8]/g, "O").replace(/[\xD9-\xDC]/g, "U")
  .replace(/[\xDD]/g, "Y").replace(/[\xDE]/g, "P").replace(/[\xE0-\xE5]/g, "a")
  .replace(/[\xE6]/g, "ae").replace(/[\xE7]/g, "c").replace(/[\xE8-\xEB]/g, "e")
  .replace(/[\xEC-\xEF]/g, "i").replace(/[\xF1]/g, "n").replace(/[\xF2-\xF6\xF8]/g, "o")
  .replace(/[\xF9-\xFC]/g, "u").replace(/[\xFE]/g, "p").replace(/[\xFD\xFF]/g, "y"))""".}
  ## Convenience func to replace accented chars (Diacritics) with normal chars (ASCII).

func editDistanceAscii*(a, b: cstring): cint {.importjs: """
  (() => {
    const s0 = #;
    const s1 = #;
    if (s0 === s1)  return 0;
    if (!s0 || !s1) return Math.max(s0.length, s1.length);

    var prevRow = new Array(s1.length + 1);
    for (var i = 0; i < prevRow.length; ++i) {
      prevRow[i] = i;
    }

    for (i = 0; i < s0.length; ++i) {
      var result = i + 1;
      for (var j = 0; j < s1.length; ++j) {
        var curCol = result;
        result = prevRow[j] + ( (s0.charAt(i) === s1.charAt(j)) ? 0 : 1 );
        var tmp = curCol + 1;
        if (result > tmp) {
          result = tmp;
        }
        tmp = prevRow[j + 1] + 1;
        if (result > tmp) {
          result = tmp;
        }
        prevRow[j] = curCol;
      }
      prevRow[j] = result;
    }
    return result;
  })()""".}
  ## https://github.com/hiddentao/fast-levenshtein

func daysBetweenYears*(fromYear, toYear: Positive): int =
  ## Get the number of days between `fromYear-01-01` and `toYear-01-01`.
  runnableExamples:
    doAssert daysBetweenYears(1970, 2020) == 18262
    doAssert daysBetweenYears(2000, 2020) == 7305
    doAssert daysBetweenYears(1970, 1970) == 0
    doAssert daysBetweenYears(2020, 2020) == 0
    doAssert daysBetweenYears(1999, 2000) == 365
  template daysBetweenYearsImpl(a): int = a * 365 + a div 4 - a div 100 + a div 400
  result = daysBetweenYearsImpl(toYear - 1) - daysBetweenYearsImpl(fromYear - 1)

template jsFmt*(code: untyped) =
  ## Nim `strformat` implemented using JavaScript string literal functions.
  runnableExamples:
    import std/jsconsole
    jsFmt:
      foo := "platypus".cstring
      bar := "capybara".cstring
      console.log fmt("foo ${foo} bar ${bar} baz ${8 + 1} !?".cstring)
  block:
    func fmt(s: cstring): cstring {.importjs: "fmt`#`".}
    template `:=`(name, value) =
      var name {.exportc: astToStr(name).} = value
    func jsFmtInjectFmt {.importjs: """
      function fmt(strings, ...values) {
        return values.reduce((finalString, value, index) => {
          return `$${finalString} $${value} $${strings[index + 1]}`}, strings[0])
      } """.}
    jsFmtInjectFmt()
    code

# func `|>`(leftSide: auto, rightSide: auto) {.importjs: "(# |> #)".}
#   ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Pipeline_operator

# func `?.`(leftSide: auto, rightSide: auto) {.importjs: "#?.#".}
#   ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining


runnableExamples:
  import sugar  # =>
  doAssert generate2FAcode() is cint
  doAssert not uuid1validate("".cstring)
  doAssert not uuid4validate("".cstring)
  doAssert not uuid5validate("".cstring)
  doAssert uuid1validate("e64cb2a6-3ff6-11eb-b378-0242ac130002".cstring)
  doAssert uuid4validate("854fc25b-02f3-45cc-b521-516991b9bb99".cstring)
  doAssert nextDays() is seq[JsObject]
  doAssert pastDays() is seq[JsObject]

  discard sparkline([1.cint, 2, 3, 4, 5], minimum = 0.cint, maximum = 10.cint)

  iife:
    # (() => {
    echo "Hello Immediately Invoked Function Expressions"
    # })();

  constant ::= "This is a JavaScript 'const'!.".cstring
  # const constant = "This is a JavaScript 'const'!.";

  proc example(argument0, argument1: int) {.codegenDecl: arrow.} =
    # const example = (argument0, argument1) => {
    echo "JavaScript Arrow Function for Nim functions"
    # }

  let example2 = (arg0, arg1: int) {.codegenDecl: arrow.} => echo "JavaScript Arrow Function for Nim Arrow Functions"
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

  doAssert removeAccents("ÇáéíóúýÁÉÍÓÚÝàèìòùÀÈÌÒÙãõñäëïöüÿÄËÏÖÜÃÕÑâêîôûÂÊÎÔ".cstring) == "CaeiouyAEIOUYaeiouAEIOUaonaeiouyAEIOUAONaeiouAEIO".cstring
  doAssert removeAccents("È,É,Ê,Ë,Û,Ù,Ï,Î,À,Â,Ô,è,é,ê,ë,û,ù,ï,î,à,â,ô,Ç,ç,Ã,ã,Õ,õ".cstring) == "E,E,E,E,U,U,I,I,A,A,O,e,e,e,e,u,u,i,i,a,a,o,C,c,A,a,O,o".cstring

  doAssert editDistanceAscii("Kitten".cstring, "Bitten".cstring) == 1.cint ## Levenshtein distance

  when off:
    jsexport constant, example, example2
    # export { constant, example, example2 };
