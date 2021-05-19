
template jsFmt*(code: untyped) =
  ## JavaScript string template literal interpolation for `cstring`.
  ##
  ## This is not meant to be better or even equal than normal stdlib `strformat`,
  ## is just for when you need faster performance and string interpolation for JavaScript targets,
  ## otherwise use the normal `strformat` for better user experience.
  ##
  ## .. Note:: To use any Nim symbols inside the string interpolation block,
  ##           the symbol declaration must have the `{.exportc.}` pragma.
  ##
  ## .. Warning:: This is unsafe, but has zero cost in performance.
  ##              Debugging with `fmt"{expr=}"` is NOT supported.
  ##
  ## See also:
  ## * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals
  ## * https://caniuse.com/template-literals
  ## * https://tc39.es/ecma262/#sec-template-literals
  ## * `strformat <strformat.html>`_
  runnableExamples:
    jsFmt:
      assert fmt"" == "" ## Empty string is Ok.
      let foo {.exportc.} = "platypus".cstring
      var bar {.exportc.} = "capybara".cstring
      assert fmt"${foo}" == "platypus".cstring
      assert fmt("foo ${foo} bar ${bar} baz ${8 + 1} !?".cstring) == "foo platypus bar capybara baz 9 !?".cstring

    jsFmt:
      let a {.exportc.} = 1
      let b {.exportc.} = 2  ## Triple-quoted and multi-line string is Ok.
      assert &"""\ ${(a + b * a + b)} \t ${3.14} \n /""".cstring == """\ 5 \t 3.14 \n /""".cstring

    var str: cstring
    jsFmt:
      assert fmt"${  -1.234560e+02  } ${-0.0} {42} ${0.0} $0 $$ {{{}}}" == "-123.456 0 {42} 0 $0 $$ {{{}}}".cstring
      assert fmt"{123.456=}" == "{123.456=}".cstring  ## Debug with `=` NOT supported.
      str = fmt"${         1_000_000         }"
    assert str == "1000000"

  block:
    func fmt(s: cstring): cstring {.importjs: "fmt`#`", used.}

    func `&`(s: cstring): cstring {.importjs: "fmt`#`", used.}

    func jsFmtInjectFmt {.importjs: """const fmt = (strings, ...values) => {
    return values.reduce((finalString, value, index) => {
      return `$${finalString}$${value}$${strings[index + 1]}`}, strings[0]).slice(1, -1)
    }""".}

    jsFmtInjectFmt()
    code
