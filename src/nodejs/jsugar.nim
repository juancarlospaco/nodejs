
func uuid1validate*(uuidv1: cstring): bool {.importjs: """
  (() => {
    const UUID_RE1 = new RegExp("^[0-9a-f]{8}-[0-9a-f]{4}-1[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$$", "i");
    return UUID_RE1.test(#);
  };)()""".}
  ## Convenience func to validate 1 UUID v1 string.

func uuid4validate*(uuidv4: cstring): bool {.importjs: """
  (() => {
    const UUID_RE4 = new RegExp("^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$$", "i");
    return UUID_RE4.test(#);
  };)()""".}
  ## Convenience func to validate 1 UUID v4 string.

func uuid5validate*(uuidv5: cstring): bool {.importjs: """
  (() => {
    const UUID_RE5 = /^[0-9a-f]{8}-[0-9a-f]{4}-[5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$$/i;
    return UUID_RE5.test(#);
  };)()""".}
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

func nextDays*(days = 7.cint): seq[any] {.importjs: "[...Array(#).keys()].map(days => new Date(Date.now() + 86400000 * days))".}
  ## Convenience func to create an seq of the next days, inclusive.

func pastDays*(days = 7.cint): seq[any] {.importjs: "[...Array(#).keys()].map(days => new Date(Date.now() - 86400000 * days))".}
  ## Convenience func to create an seq of the past days, inclusive.
