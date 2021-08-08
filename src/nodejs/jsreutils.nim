from std/jsre import RegExp

template groups*(self: RegExp; input: cstring; groups: varargs[var cstring]) =
  ## Named capture groups.
  ## Similar to `var [a, b, c] = regex.exec(input).slice(1);` in JavaScript.
  runnableExamples:
    import std/jsre
    const isoRe = "([2000-2021]{4})-([01-12]{2})-([01-31]{2})T([00-59]{2}):([00-59]{2}):([00-59]{2})".cstring

    block:
      let rex = newRegExp(isoRe)
      var year, month, day, hour, minute, second: cstring
      rex.groups "2021-02-31T12:59:30.666", year, month, day, hour, minute, second
      assert year == "2021" and month == "02" and day == "31"
      assert hour == "12" and minute == "59" and second == "30"

    block:
      let rex = newRegExp(isoRe)
      var year, month, day, hour, minute, second: cstring
      # "second" is missing, no bug, no index error.
      rex.groups "2021-02-31T12:59:30.666", year, month, day, hour, minute
      assert year == "2021" and month == "02" and day == "31"
      assert hour == "12" and minute == "59"
      assert second  == cstring.default

    block:
      let rex = newRegExp(isoRe)
      var year, month, day, hour, minute, second, offByOne: cstring
      # "offByOne" is an extra argument, no bug, no index error.
      rex.groups "2021-02-31T12:59:30.666", year, month, day, hour, minute, second, offByOne
      assert offByOne == cstring.default

  doAssert groups.len > 0, "groups must not be empty varargs[var cstring]"
  {.emit: [groups, " = ", self, ".exec('", input, "').slice(1);"] .}
