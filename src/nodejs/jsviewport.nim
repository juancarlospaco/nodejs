## - https://developer.mozilla.org/en-US/docs/Web/API/VisualViewport
import std/dom

type VisualViewport* {.importc.} = ref object of EventTarget
  offsetLeft*, offsetTop*, pageLeft*, pageTop*, width*, height*, scale*: float
  onResize*: proc (event: Event) {.closure.}
  onScroll*: proc (event: Event) {.closure.}

func visualViewport*(self: Window): VisualViewport {.importjs: "#.$1", nodecl.}
