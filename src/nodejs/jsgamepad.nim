## - Gamepad controller API for the browser. Works only over HTTPS (not localhost).
## - https://developer.mozilla.org/en-US/docs/Web/API/Gamepad
## - Experimental, see https://caniuse.com/gamepad
## - Live demo http://luser.github.io/gamepadtest

type
  GamepadButton* = ref object of JsRoot  ## https://developer.mozilla.org/en-US/docs/Web/API/GamepadButton
    pressed*: bool                ## https://developer.mozilla.org/en-US/docs/Web/API/GamepadButton/pressed
    touched*: bool                ## https://developer.mozilla.org/en-US/docs/Web/API/GamepadButton/touched
    value*:   float               ## https://developer.mozilla.org/en-US/docs/Web/API/GamepadButton/value

  Gamepad* = ref object of JsRoot ## https://developer.mozilla.org/en-US/docs/Web/API/Gamepad
    axis*: seq[float]             ## https://developer.mozilla.org/en-US/docs/Web/API/Gamepad/axes
    connected*: bool              ## https://developer.mozilla.org/en-US/docs/Web/API/Gamepad/connected
    displayId*: SomeNumber        ## https://developer.mozilla.org/en-US/docs/Web/API/Gamepad/displayId
    hand*: cstring                ## https://developer.mozilla.org/en-US/docs/Web/API/Gamepad/hand
    id*: cstring                  ## https://developer.mozilla.org/en-US/docs/Web/API/Gamepad/id
    index*: SomeNumber            ## https://developer.mozilla.org/en-US/docs/Web/API/Gamepad/index
    mapping*: cstring             ## https://developer.mozilla.org/en-US/docs/Web/API/Gamepad/mapping
    buttons*: seq[GamepadButton]  ## https://developer.mozilla.org/en-US/docs/Web/API/Gamepad/buttons

func getGamepads*(): seq[Gamepad] {.importjs: "(navigator.$1(@) || [])".}

func getGamepads*(index: Natural): Gamepad {.importjs: "(navigator.$1()[#])".}
