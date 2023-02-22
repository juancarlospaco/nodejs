## Idle Detector for JavaScript targets.
## * https://developer.mozilla.org/en-US/docs/Web/API/IdleDetector

import std/asyncjs


type IdleDetector* = ref object of JsRoot  ## https://developer.mozilla.org/en-US/docs/Web/API/IdleDetector
  screenState*: cstring                    ## https://developer.mozilla.org/en-US/docs/Web/API/IdleDetector/screenState
  userState*:   cstring                    ## https://developer.mozilla.org/en-US/docs/Web/API/IdleDetector/userState


func newIdleDetector(): IdleDetector {.importjs: "(new IdleDetector())".}


func requestPermission*(self: IdleDetector): Future[cstring] {.importjs: "#.$1(@)".}


func start*(self: IdleDetector; options: auto): Future[void] {.importjs: "#.$1(#)".}


func start*(self: IdleDetector): Future[void] {.importjs: "#.$1()".}
