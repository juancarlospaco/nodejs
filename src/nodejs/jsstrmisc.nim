import std/strutils

type ParseFloatOptions* = enum  ## Options for `parseFloatThousandSep`.
  pfLeadingDot,    ## Allow leading dot, like ".9" and similar.
  pfTrailingDot,   ## Allow trailing dot, like "9." and similar.
  pfSepAnywhere,   ## Allow separator anywhere in between, like "9,9", "9,99".
  pfDotOptional    ## Allow "9", "-0", integer literals, etc.
  pfNanInf         ## Allow "NaN", "Inf", "-Inf", etc.

func parseFloatThousandSep*(str: openArray[char]; options: set[ParseFloatOptions] = {}; sep = ','; decimalDot = '.'): float =
  ## Convenience func for `parseFloat` which allows for thousand separators,
  ## this is designed to parse floats as found in the wild formatted for humans.
  ##
  ## Fine grained flexibility and strictness is up to the user,
  ## you can set the `options` using `ParseFloatOptions` enum.
  ##
  ## `parseFloatThousandSep` "prepares" `str` and then calls `parseFloat`.
  ##
  ## The following assumptions and requirements must be met:
  ## - `str` must not be empty string.
  ## - `str` must be stripped of trailing and leading whitespaces.
  ## - `sep` and `decimalDot` must be different.
  ## - `sep` must not be in `{'-', '+', 'e', 'i', 'n', 'f', 'a', '\n'}`.
  ## - `decimalDot` must not be in `{'-', '+', 'e', 'i', 'n', 'f', 'a', ' ', '\t', '\v', '\c', '\n', '\f'}`.
  assert sep notin {'-', '+', 'e', 'i', 'n', 'f', 'a', '\n'}
  assert sep != decimalDot

  template parseFloatThousandSepRaise(i: int; c: char; s: openArray[char]) =
    raise newException(ValueError, "Invalid float, invalid char $1 at index $2 for input $3" % [$c, $i, $s])

  let strLen = str.len
  if strLen == 0: # Empty string.
    parseFloatThousandSepRaise(0, ' ', "empty string")
  if str[0] == sep:                                         # ",1"
    parseFloatThousandSepRaise(0, sep, str)
  if pfLeadingDot notin options and str[0] == decimalDot:   # ".1"
    parseFloatThousandSepRaise(0, decimalDot, str)
  if str[^1] == sep:                                        # "1,"
    parseFloatThousandSepRaise(strLen, sep, str)
  if pfTrailingDot notin options and str[^1] == decimalDot: # "1."
    parseFloatThousandSepRaise(strLen, decimalDot, str)
  if pfSepAnywhere notin options and (str.len <= 4 and sep in str):
    parseFloatThousandSepRaise(0, sep, str)                 # "1,1"

  if (strLen == 3 or strLen == 4) and (
    (str[0] in {'i', 'I'} and str[1] in {'n', 'N'} and str[2] in {'f', 'F'}) or
    (str[0] in {'n', 'N'} and str[1] in {'a', 'A'} and str[2] in {'n', 'N'}) or
    (str[0] in {'+', '-'} and str[1] in {'i', 'I'} and str[2] in {'n', 'N'} and str[3] in {'f', 'F'}) or
    (str[0] in {'+', '-'} and str[1] in {'n', 'N'} and str[2] in {'a', 'A'} and str[3] in {'n', 'N'})):
    if pfNanInf notin options:
      parseFloatThousandSepRaise(0, sep, str)
    else:
      return parseFloat(str.join)  # Allow NaN, Inf, -Inf, +Inf

  var
    s = newStringOfCap(strLen)
    successive: int
    afterDot, lastWasDot, lastWasSep, hasAnySep, isNegative, hasAnyDot, isScientific: bool

  for idx, c in str:
    if c in '0' .. '9':  # Digits
      if hasAnySep and not afterDot and successive > 2:
        parseFloatThousandSepRaise(idx, c, str)
      else:
        s.add c
        lastWasSep = false
        lastWasDot = false
        inc successive
    elif c == sep:  # Thousands separator, this is NOT the dot
      if pfSepAnywhere notin options and (lastWasSep or afterDot) or
        (isNegative and idx == 1 or idx == 0) or isScientific:
        parseFloatThousandSepRaise(idx, c, str)
      else:
        lastWasSep = true # Do NOT add the Thousands separator here.
        hasAnySep = true
        successive = 0
    elif c == decimalDot:  # This is the dot
      if (not afterDot and not hasAnyDot and not lastWasDot) and
        (pfLeadingDot notin options and (isNegative and idx == 1 or idx == 0)) or
        (hasAnySep and pfSepAnywhere notin options and successive != 3): # Disallow .1
        parseFloatThousandSepRaise(idx, c, str)
      else:
        s.add '.' # Replace decimalDot to '.' so parseFloat can take it.
        successive = 0
        lastWasDot = true
        afterDot = true
        hasAnyDot = true
    elif c == '-':  # Allow negative float
      if isNegative or idx != 0 and not isScientific: # Disallow ---1.0
        parseFloatThousandSepRaise(idx, c, str)       # Allow 1.0e-9
      else:
        s.add '-'
        if idx == 0: # Allow 1.0e-9
          isNegative = true
    elif c in {'e', 'E'}:   # Allow scientific notation
      if isScientific:
        parseFloatThousandSepRaise(idx, c, str)
      else:
        s.add 'e'
        isScientific = true

  if pfDotOptional notin options and not hasAnyDot:
    parseFloatThousandSepRaise(0, sep, str)
  result = parseFloat(s)


runnableExamples"-b:js -d:nodejs --experimental:strictFuncs":

  func example() =
    assert parseFloatThousandSep("0.0") == 0.0
    assert parseFloatThousandSep("1.0") == 1.0
    assert parseFloatThousandSep("-0.0") == -0.0
    assert parseFloatThousandSep("-1.0") == -1.0
    assert parseFloatThousandSep("1.000") == 1.0
    assert parseFloatThousandSep("1.000") == 1.0
    assert parseFloatThousandSep("-1.000") == -1.0
    assert parseFloatThousandSep("-1,222.0001") == -1222.0001
    assert parseFloatThousandSep("3.141592653589793") == 3.141592653589793
    assert parseFloatThousandSep("6.283185307179586") == 6.283185307179586
    assert parseFloatThousandSep("2.718281828459045") == 2.718281828459045
    assert parseFloatThousandSep("10,000,000.000") == 10000000.0
    assert parseFloatThousandSep("1,222.0001") == 1222.0001
    assert parseFloatThousandSep("10.000,0", {}, '.', ',') == 10000.0
    assert parseFloatThousandSep("1'000'000,000", {}, '\'', ',') == 1000000.0
    assert parseFloatThousandSep("1000000", {pfDotOptional}) == 1000000.0
    assert parseFloatThousandSep("-1,000", {pfDotOptional}) == -1000.0
    assert parseFloatThousandSep("1000,000", {pfDotOptional}) == 1000000.0
    assert parseFloatThousandSep(".1", {pfLeadingDot}) == 0.1
    assert parseFloatThousandSep("1", {pfDotOptional}) == 1.0
    assert parseFloatThousandSep("1.", {pfTrailingDot}) == 1.0
    assert parseFloatThousandSep("10,0.0,0,0", {pfSepAnywhere}) == 100.0
    assert parseFloatThousandSep("01.00") == 1.0
    assert parseFloatThousandSep("1,000.000e-9") == 1e-06
    assert parseFloatThousandSep("10,00.0", {pfSepAnywhere}) == 1000.0
    assert parseFloatThousandSep("0", {pfDotOptional}) == 0.0
    assert parseFloatThousandSep("-0", {pfDotOptional}) == -0.0
    assert parseFloatThousandSep("1,111", {pfDotOptional}) == 1111.0
    assert parseFloatThousandSep(".1", {pfLeadingDot}) == 0.1
    assert parseFloatThousandSep("1.", {pfTrailingDot}) == 1.0
    assert parseFloatThousandSep(".1", {pfLeadingDot,pfTrailingDot}) == 0.1
    assert parseFloatThousandSep("1.", {pfLeadingDot,pfTrailingDot}) == 1.0
    assert parseFloatThousandSep("1", {pfDotOptional}) == 1.0
    assert parseFloatThousandSep("1.0,0,0", {pfSepAnywhere}) == 1.0
    assert parseFloatThousandSep(".10", {pfLeadingDot}) == 0.1
    assert parseFloatThousandSep("10.", {pfTrailingDot}) == 10.0
    assert parseFloatThousandSep("10", {pfDotOptional, pfSepAnywhere}) == 10.0
    assert parseFloatThousandSep("1.0,0,0,0,0,0,0,0", {pfSepAnywhere}) == 1.0
    assert parseFloatThousandSep("0,0,0,0,0,0,0,0.1", {pfSepAnywhere}) == 0.1
    assert parseFloatThousandSep("1.0e9") == 1000000000.0
    assert parseFloatThousandSep("1.0e-9") == 1e-09
    assert parseFloatThousandSep("1,000.000e9") == 1000000000000.0
    assert parseFloatThousandSep("1e9", {pfDotOptional}) == 1000000000.0
    assert parseFloatThousandSep("1.0E9") == 1000000000.0
    assert parseFloatThousandSep("1.0E-9") == 1e-09
    assert parseFloatThousandSep("Inf", {pfNanInf}) == Inf
    assert parseFloatThousandSep("-Inf", {pfNanInf}) == -Inf
    assert parseFloatThousandSep("+Inf", {pfNanInf}) == +Inf
    assert parseFloatThousandSep("1000.000000E+90") == 1e93
    assert parseFloatThousandSep("-10 000 000 000.0001", sep=' ') == -10000000000.0001
    assert parseFloatThousandSep("-10 000 000 000,0001", sep=' ', decimalDot = ',') == -10000000000.0001
    doAssertRaises(ValueError): discard parseFloatThousandSep(" ", {pfDotOptional})
    doAssertRaises(ValueError): discard parseFloatThousandSep(".1.", {pfLeadingDot,pfTrailingDot})
    doAssertRaises(ValueError): discard parseFloatThousandSep("1ee9", {pfDotOptional})
    doAssertRaises(ValueError): discard parseFloatThousandSep("aNa", {pfNanInf})
    doAssertRaises(ValueError): discard parseFloatThousandSep("fnI", {pfNanInf})
    doAssertRaises(ValueError): discard parseFloatThousandSep("1,000.000,000,E,+,9,0", {pfSepAnywhere})
    for s in ["1,11", "1,1", "1,0000.000", "--", "..", "1,,000", "1..000", "1,000000", ",1", "1,",
      "1.", ".1", "10,00.0", "1,000.000ee9", "1e02.2", "1.0e--9", "Inf", "-Inf", "+Inf", "NaN"]:
      doAssertRaises(ValueError): discard parseFloatThousandSep(s)

  example()
  static: example()
