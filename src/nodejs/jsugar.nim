import jsffi
export jsffi

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


runnableExamples:
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
