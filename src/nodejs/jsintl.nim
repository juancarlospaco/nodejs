## Internationalization API for JavaScript targets.
## * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl
when not defined(js):
  {.error: "This module only works on the JavaScript platform".}

type
  Collator*           = ref object of JsRoot  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Collator
  DisplayNames*       = ref object of JsRoot  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DisplayNames
  ListFormat*         = ref object of JsRoot  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/ListFormat
  NumberFormat*       = ref object of JsRoot  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat
  PluralRules*        = ref object of JsRoot  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/PluralRules
  RelativeTimeFormat* = ref object of JsRoot  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/RelativeTimeFormat

func getCanonicalLocales*(locales: cstring): seq[cstring] {.importjs: "(Intl.$1(#) || [])".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/getCanonicalLocales

func getCanonicalLocales*(locales: openArray[cstring]): seq[cstring] {.importjs: "(Intl.$1(#) || [])".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/getCanonicalLocales

func newCollator*(): Collator {.importjs: "new Intl.Collator()".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Collator/Collator

func newCollator*(locales: openArray[cstring]): Collator {.importjs: "new Intl.Collator(#)".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Collator/Collator

func compare*(self: Collator; string1, string2: cstring): int {.importjs: "(#.$1(#, #) || 0)".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Collator/compare

func newDisplayNames*(): DisplayNames {.importjs: "new Intl.DisplayNames()".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DisplayNames/DisplayNames

func newDisplayNames*(locales: openArray[cstring]): DisplayNames {.importjs: "new Intl.DisplayNames(#)".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DisplayNames/DisplayNames

func `of`*(self: DisplayNames; code: cstring): cstring {.importjs: "(#.$1(#) || '')".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DisplayNames/of

func newListFormat*(): ListFormat {.importjs: "new Intl.ListFormat()".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/ListFormat/ListFormat

func newListFormat*(locales: openArray[cstring]): ListFormat {.importjs: "new Intl.ListFormat(#)".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/ListFormat/ListFormat

func format*(self: ListFormat; list: openArray[cstring]): cstring {.importjs: "(#.$1(#) || '')".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/ListFormat/format

func newNumberFormat*(): NumberFormat {.importjs: "new Intl.NumberFormat()".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat

func newNumberFormat*(locales: openArray[cstring]): NumberFormat {.importjs: "new Intl.NumberFormat(#)".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat

func format*(self: NumberFormat; number: SomeNumber): cstring {.importjs: "(#.$1(#) || '')".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/format

func newPluralRules*(): PluralRules {.importjs: "new Intl.PluralRules()".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/PluralRules/PluralRules

func newPluralRules*(locales: openArray[cstring]): PluralRules {.importjs: "new Intl.PluralRules(#)".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/PluralRules/PluralRules

func select*(self: PluralRules; number: SomeInteger): cstring {.importjs: "(#.$1(#) || '')".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/PluralRules/select

func newRelativeTimeFormat*(): RelativeTimeFormat {.importjs: "new Intl.RelativeTimeFormat()".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/RelativeTimeFormat/RelativeTimeFormat

func newRelativeTimeFormat*(locales: openArray[cstring]): RelativeTimeFormat {.importjs: "new Intl.RelativeTimeFormat(#)".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/RelativeTimeFormat/RelativeTimeFormat

func select*(self: RelativeTimeFormat; value: SomeNumber; unit: cstring): cstring {.importjs: "(#.$1(#) || '')".}
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/RelativeTimeFormat/format
