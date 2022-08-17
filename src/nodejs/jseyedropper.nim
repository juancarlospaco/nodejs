## - EyeDropper API for the browser.
## - https://developer.mozilla.org/en-US/docs/Web/API/EyeDropper_API
## - Experimental, see https://caniuse.com/mdn-api_eyedropper
## - Live demo https://captainbrosset.github.io/eyedropper-demos
##
## .. image:: https://web-dev.imgix.net/image/8WbTDNrhLsU0El80frMBGE4eMCD3/gD2C2AmnOnP4EhVBhczm.png

func eyeDropperOpen*(default: static[cstring] = "#000000".cstring): cstring {.importjs: "((await (new EyeDropper()).open()).sRGBHex || #)".}
