## - Web Video Text Tracks Subtitles API for the browser.
## - https://developer.mozilla.org/en-US/docs/Web/API/WebVTT_API
## - https://caniuse.com/webvtt
## - Live demo https://web.dev/media-accessibility

import std/dom

type
  VTTRegion* = ref object of JsRoot   ## https://developer.mozilla.org/en-US/docs/Web/API/VTTRegion
    width*, lines*, regionAnchorX*, regionAnchorY*, viewportAnchorX*, viewportAnchorY* : SomeNumber
    id*: cstring

  VTTCue* = ref object of JsRoot          ## https://developer.mozilla.org/en-US/docs/Web/API/VTTCue
    vertical*:     cstring                ## https://developer.mozilla.org/en-US/docs/Web/API/VTTCue/vertical
    align*:         cstring               ## https://developer.mozilla.org/en-US/docs/Web/API/VTTCue/align
    lineAlign*:     cstring               ## https://developer.mozilla.org/en-US/docs/Web/API/VTTCue/lineAlign
    positionAlign*: cstring               ## https://developer.mozilla.org/en-US/docs/Web/API/VTTCue/positionAlign
    size*:          SomeNumber            ## https://developer.mozilla.org/en-US/docs/Web/API/VTTCue/size
    snapToLines*:   bool                  ## https://developer.mozilla.org/en-US/docs/Web/API/VTTCue/snapToLines
    text*:          cstring               ## https://developer.mozilla.org/en-US/docs/Web/API/VTTCue/text
    line*:          cstring or SomeNumber ## https://developer.mozilla.org/en-US/docs/Web/API/VTTCue/line
    position*:      cstring or SomeNumber ## https://developer.mozilla.org/en-US/docs/Web/API/VTTCue/position
    region*:        VTTRegion             ## https://developer.mozilla.org/en-US/docs/Web/API/VTTCue/region

func newVTTCue*(startTime, endTime: float; text: cstring): VTTCue {.importjs: "(new VTTCue(#, #, #))".}

func newVTTCue*(startTime, endTime: Natural; text: cstring): VTTCue {.importjs: "(new VTTCue(#, #, #))".}

func newVTTRegion*(): VTTRegion {.importjs: "(new VTTRegion(@))".}

func getCueAsHTML*(self: VTTCue): Node {.importjs: "#.$1()".}
