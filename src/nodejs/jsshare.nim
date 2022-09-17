## - Share API for the browser. Works only over HTTPS (not localhost).
## - https://developer.mozilla.org/en-US/docs/Web/API/Web_Share_API
## - Experimental, see https://caniuse.com/web-share
##
## .. image:: https://raw.githubusercontent.com/juancarlospaco/nodejs/main/docs/nodejs/jsshare.jpg

func canShare*(): bool {.importjs: "(Navigator.$1() || false)".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/Navigator/canShare

func canShare*(url: cstring): bool {.importjs: "(Navigator.$1({url: #}) || false)".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/Navigator/canShare

func canShare*(text, url: cstring): bool {.importjs: "(Navigator.$1({text: #, url: #}) || false)".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/Navigator/canShare

func canShare*(title, text, url: cstring): bool {.importjs: "(Navigator.$1({title: #, text: #, url: #}) || false)".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/Navigator/canShare

func share*(url: cstring) {.importjs: "(await Navigator.$1({url: #}) || undefined)", discardable.}
  ## https://developer.mozilla.org/en-US/docs/Web/API/Navigator/share

func share*(text, url: cstring) {.importjs: "(await Navigator.$1({text: #, url: #}) || undefined)", discardable.}
  ## https://developer.mozilla.org/en-US/docs/Web/API/Navigator/share

func share*(title, text, url: cstring) {.importjs: "(await Navigator.$1({title: #, text: #, url: #}) || undefined)", discardable.}
  ## https://developer.mozilla.org/en-US/docs/Web/API/Navigator/share
