## - USB 3.0 IO API for the browser. Works only over HTTPS (not localhost).
## - https://developer.mozilla.org/en-US/docs/Web/API/USB
## - Experimental, see https://caniuse.com/webusb

type USBDevice* = ref object of JsRoot  ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice
  deviceClass*:           SomeNumber    ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/deviceClass
  deviceProtocol*:        SomeNumber    ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/deviceProtocol
  deviceSubclass*:        SomeNumber    ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/deviceSubclass
  deviceVersionMajor*:    SomeNumber    ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/deviceVersionMajor
  deviceVersionMinor*:    SomeNumber    ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/deviceVersionMinor
  deviceVersionSubminor*: SomeNumber    ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/deviceVersionSubminor
  manufacturerName*:      cstring       ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/manufacturerName
  opened*:                bool          ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/opened
  productId:              SomeNumber    ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/productID
  productName*:           cstring       ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/productName
  serialNumber*:          SomeNumber    ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/serialNumber
  usbVersionMajor*:       SomeNumber    ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/usbVersionMajor
  usbVersionMinor*:       SomeNumber    ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/usbVersionMinor
  usbVersionSubminor*:    SomeNumber    ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/usbVersionSubminor
  vendorID*:              SomeNumber    ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/vendorID

func getDevices*(): seq[USBDevice] {.importjs: "(await navigator.usb.$1() || [])".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/USB/getDevices

func requestDevice*(vendorId: SomeNumber): seq[USBDevice] {.importjs: "(await navigator.usb.$1([{vendorId: #}]) || [])".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/USB/requestDevice

func requestDevice*(productId: SomeNumber): seq[USBDevice] {.importjs: "(await navigator.usb.$1([{productId: #}]) || [])".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/USB/requestDevice

func requestDevice*(serialNumber: SomeNumber): seq[USBDevice] {.importjs: "(await navigator.usb.$1([{serialNumber: #}]) || [])".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/USB/requestDevice

func close*(self: USBDevice) {.importjs: "(await #.$1())", discardable.}
  ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/close

func reset*(self: USBDevice) {.importjs: "(await #.$1())", discardable.}
  ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/reset

func claimInterface*(self: USBDevice; interfaceNumber: SomeNumber) {.importjs: "(await #.$1(#))", discardable.}
  ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/claimInterface

func releaseInterface*(self: USBDevice; interfaceNumber: SomeNumber) {.importjs: "(await #.$1(#))", discardable.}
  ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/releaseInterface

func clearHalt*(self: USBDevice; direction: cstring; endpointNumber: SomeNumber) {.importjs: "(await #.$1(#, #))", discardable.}
  ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/clearHalt

func selectConfiguration*(self: USBDevice; configurationValue: SomeNumber) {.importjs: "(await #.$1(#))", discardable.}
  ## https://developer.mozilla.org/en-US/docs/Web/API/USBDevice/selectConfiguration
