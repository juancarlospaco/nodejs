## Keyboard API for JavaScript targets.
## * https://developer.mozilla.org/en-US/docs/Web/API/Keyboard

import std/asyncjs


type KeyboardLayoutMap* = ref object of JsRoot  ## https://developer.mozilla.org/en-US/docs/Web/API/KeyboardLayoutMap
  entries*: seq[(cstring, cstring)]          ## https://developer.mozilla.org/en-US/docs/Web/API/KeyboardLayoutMap/entries
  size*:    int                                 ## https://developer.mozilla.org/en-US/docs/Web/API/KeyboardLayoutMap/size


func get*(self: KeyboardLayoutMap; key: cstring): cstring {.importjs: "(#.$1(#) || '')".} =
  ## https://developer.mozilla.org/en-US/docs/Web/API/KeyboardLayoutMap/get


func has*(self: KeyboardLayoutMap; key: cstring): bool {.importjs: "(#.$1(#) || false)".} =
  ## https://developer.mozilla.org/en-US/docs/Web/API/KeyboardLayoutMap/has


func getLayoutMap*(): Future[KeyboardLayoutMap] {.importjs: "navigator.keyboard.$1(@)".}


func unlock*(): Future[void] {.importjs: "navigator.keyboard.$1(@)".}


func lock*(): Future[void] {.importjs: "navigator.keyboard.$1(@)".}


func lock*(keycodes: openArray[cstring]): Future[void] {.importjs: "navigator.keyboard.$1(@)".}
