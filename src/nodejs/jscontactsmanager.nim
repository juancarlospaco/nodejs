## Contacts Manager for Nim.
## * https://developer.mozilla.org/en-US/docs/Web/API/ContactsManager

import std/[jsffi, asyncjs]


func getProperties*(): Future[seq[cstring]] {.importjs: "navigator.contacts.$1(@)".}


func select*(properties: openArray[cstring]; options: JsObject): Future[seq[JsObject]] {.importjs: "navigator.contacts.$1(@)".}
