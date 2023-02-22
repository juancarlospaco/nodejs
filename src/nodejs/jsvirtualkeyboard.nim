## Virtual Keyboard for Nim.
## * https://developer.mozilla.org/en-US/docs/Web/API/VirtualKeyboard


type VirtualKeyboard* = ref object of JsRoot  ## https://developer.mozilla.org/en-US/docs/Web/API/VirtualKeyboard
  overlaysContent*: bool                      ## https://developer.mozilla.org/en-US/docs/Web/API/VirtualKeyboard/overlaysContent
  boundingRect*: array[4, int]                ## https://developer.mozilla.org/en-US/docs/Web/API/VirtualKeyboard/boundingRect


{.push importcpp.}


func hide*(self: VirtualKeyboard)


func show*(self: VirtualKeyboard)


{.pop.}
