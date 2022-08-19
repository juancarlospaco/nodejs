## - Geolocation API for the browser. Works only over HTTPS (not localhost).
## - https://developer.mozilla.org/en-US/docs/Web/API/Geolocation_API
## - https://caniuse.com/geolocation

type
  GeolocationCoordinates* = ref object of JsRoot  ## https://developer.mozilla.org/en-US/docs/Web/API/GeolocationCoordinates
    latitude*, longitude*, altitude*, accuracy*, altitudeAccuracy*, heading*, speed*: SomeNumber

  GeolocationPosition* = ref object of JsRoot     ## https://developer.mozilla.org/en-US/docs/Web/API/GeolocationPosition
    coords*: GeolocationCoordinates

func clearWatch*(id: SomeNumber) {.importjs: "(navigator.geolocation.$1(#))", discardable.}

func getCurrentPosition*[T](success: T) {.importjs: "(navigator.geolocation.$1(#))", discardable.}

func getCurrentPosition*[T](success, error: T) {.importjs: "(navigator.geolocation.$1(#, #))", discardable.}

func getCurrentPosition*[T](success, error: T; maximumAge, timeout: SomeNumber; enableHighAccuracy: bool) {.importjs: "(navigator.geolocation.$1(#, #, {maximumAge: #, timeout: #, enableHighAccuracy: #}))", discardable.}

func hasGeolocation*(): bool {.importjs: "('geolocation' in navigator)@".}
