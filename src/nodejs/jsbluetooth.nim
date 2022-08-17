## - Bluetooth API for the browser. Works only over HTTPS (not localhost).
## - https://developer.mozilla.org/en-US/docs/Web/API/Web_Bluetooth_API
## - Experimental, see https://caniuse.com/web-bluetooth

type
  BluetoothDevice* = ref object of JsRoot  ## https://developer.mozilla.org/en-US/docs/Web/API/BluetoothDevice
    id*: cstring    ## https://developer.mozilla.org/en-US/docs/Web/API/BluetoothDevice/id
    name*: cstring  ## https://developer.mozilla.org/en-US/docs/Web/API/BluetoothDevice/name

  Bluetooth* = ref object of JsRoot    ## https://developer.mozilla.org/en-US/docs/Web/API/Bluetooth
    referringDevice*: BluetoothDevice  ## https://developer.mozilla.org/en-US/docs/Web/API/Bluetooth/referringDevice

func watchAdvertisements*(self: BluetoothDevice): bool {.importjs: "((await #.$1()) === undefined || false)".}

func unwatchAdvertisements*(self: BluetoothDevice) {.importjs: "#.$1()", discardable.}

func requestDevice*(self: Bluetooth): BluetoothDevice {.importjs: "(await #.$1())".}

func requestDevice*(self: Bluetooth; acceptAllDevices: bool): BluetoothDevice {.importjs: "(await #.$1({acceptAllDevices: #}))".}

func getService*(name: cstring): cstring {.importjs: "(BluetoothUUID.$1(#) || '')".}

func getDescriptor*(name: cstring): cstring {.importjs: "(BluetoothUUID.$1(#) || '')".}

func getCharacteristic*(name: cstring): cstring {.importjs: "(BluetoothUUID.$1(#) || '')".}

func canonicalUUID*(name: cstring): cstring {.importjs: "(BluetoothUUID.$1(#) || '')".}
