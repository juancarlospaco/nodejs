## - Share API for the browser. Works only over HTTPS (not localhost).
## - https://developer.mozilla.org/en-US/docs/Web/API/Web_Share_API
## - Experimental, see https://caniuse.com/web-share

func canShare*(): bool {.importjs: "Navigator.$1()".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/Navigator/canShare

func canShare*(url: cstring): bool {.importjs: "Navigator.$1({url: #})".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/Navigator/canShare

func canShare*(text, url: cstring): bool {.importjs: "Navigator.$1({text: #, url: #})".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/Navigator/canShare

func canShare*(title, text, url: cstring): bool {.importjs: "Navigator.$1({title: #, text: #, url: #})".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/Navigator/canShare

func share*(url: cstring) {.importjs: "(await Navigator.$1({url: #}) || undefined)", discardable.}
  ## https://developer.mozilla.org/en-US/docs/Web/API/Navigator/share

func share*(text, url: cstring) {.importjs: "(await Navigator.$1({text: #, url: #}) || undefined)", discardable.}
  ## https://developer.mozilla.org/en-US/docs/Web/API/Navigator/share

func share*(title, text, url: cstring) {.importjs: "(await Navigator.$1({title: #, text: #, url: #}) || undefined)", discardable.}
  ## https://developer.mozilla.org/en-US/docs/Web/API/Navigator/share
