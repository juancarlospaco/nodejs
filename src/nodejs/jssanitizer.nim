## - Sanitizer API for the browser.
## - https://developer.mozilla.org/en-US/docs/Web/API/Sanitizer
## - Experimental, see https://caniuse.com/mdn-api_sanitizer

import std/dom

type Sanitizer* = ref object of JsRoot  ## https://developer.mozilla.org/en-US/docs/Web/API/Sanitizer

func newSanitizer*(): Sanitizer {.importjs: "(new Sanitizer(@))".}

func newSanitizer*(allowComments, allowCustomElements: bool; allowElements, blockElements, dropElements: seq[cstring]): Sanitizer {.importjs: "(new Sanitizer({allowComments: #, allowCustomElements: #, allowElements: #, blockElements: #, dropElements: #}))".}

func newSanitizer*(allowComments, allowCustomElements: bool): Sanitizer {.importjs: "(new Sanitizer({allowComments: #, allowCustomElements: #}))".}

func sanitizeFor*(self: Sanitizer; element, input: cstring): Node {.importjs: "#.$1(#, #)".}

func sanitize*(self: Sanitizer; input: Node): Node {.importjs: "#.$1(#)".}
