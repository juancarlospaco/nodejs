## * URL Patterns API https://developer.mozilla.org/en-US/docs/Web/API/URL_Pattern_API

from std/jsffi import JsObject

type URLPattern* = ref object of JsRoot  ## https://developer.mozilla.org/en-US/docs/Web/API/URL_Pattern_API
  hash*, hostname*, password*, pathname*, port, protocol*, search*, username*: cstring

func newURLPattern*(input, baseURL: cstring): URLPattern {.importjs: "(new URLPattern((# || ''), (# || '')))".}

func newURLPattern*(input: cstring or JsObject): URLPattern {.importjs: "(new URLPattern((# || '')))".}

func newURLPattern*(): URLPattern {.importjs: "(new URLPattern(''))".}

func exec*(self: URLPattern; input, baseURL: cstring): JsObject {.importjs: "(#.$1((# || ''), (# || '')) || {})".}

func exec*(self: URLPattern; input: cstring): JsObject {.importjs: "(#.$1((# || '')) || {})".}

func test*(self: URLPattern; input, baseURL: cstring): bool {.importjs: "(#.$1((# || ''), (# || '')) || false)".}

func test*(self: URLPattern; input: cstring): bool {.importjs: "(#.$1((# || '')) || false)".}

func `port=`*(self: URLPattern; value: uint16) {.importjs: "#.port = (# || '')".}

func port*(self: URLPattern): uint16 {.importjs: "(#.port || 0)".}
