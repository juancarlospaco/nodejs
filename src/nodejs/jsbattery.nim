## - Battery API for the browser. Works only with Battery powered devices.
## - https://developer.mozilla.org/en-US/docs/Web/API/Battery_Status_API
## - Experimental, see https://caniuse.com/battery-status

func hasBattery*(): bool {.importjs: "(!!navigator.getBattery || false)".}
  ## Return `true` if Battery API is supported.

func isBatteryCharging*(): bool {.importjs: "((await navigator.getBattery()).charging || false)".}
  ## Return `true` if battery is currently charging.

func getBatteryLevel*(): int {.importjs: "(parseInt((await navigator.getBattery()).level * 100) || 0)".}
  ## Return the current battery charge level as `int`.

func getBatteryChargingTime*(): float {.importjs: "(parseFloat((await navigator.getBattery()).chargingTime) || 0.0)".}
  ## Return the current battery charging time as `float`, this can be `Inf`.

func getBatteryDischargingTime*(): float {.importjs: "(parseFloat((await navigator.getBattery()).dischargingTime) || 0.0)".}
  ## Return the current battery discharging time as `float`, this can be `Inf`.
