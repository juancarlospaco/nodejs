
import std/asyncjs

type
  Immediate* = ref object of JsRoot ## https://nodejs.org/api/timers.html#timers_class_immediate
  Timeout* = ref object of JsRoot   ## https://nodejs.org/api/timers.html#timers_class_timeout

func importTimers*() {.importjs: "import * as timers from 'timers'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireTimers*() {.importjs: "const timers = require('timers')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func importTimersPromises*() {.importjs: "import * as timersPromises from 'timers/promises'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireTimersPromises*() {.importjs: "const timersPromises = require('timers/promises')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func newImmediate*(): Immediate {.importjs: "(new timers.Immediate())".}

func hasRef*(self: Immediate): bool {.importjs: "#.$1()".}
  ## https://nodejs.org/api/timers.html#timers_immediate_hasref

func refs*(self: Immediate): Immediate {.importjs: "#.ref()".}
  ## https://nodejs.org/api/timers.html#timers_immediate_ref

func unrefs*(self: Immediate): Immediate {.importjs: "#.unref()".}
  ## https://nodejs.org/api/timers.html#timers_immediate_unref

func setTimeout*[T](callback: T; delay: cint): Timeout {.importjs: "timers.$1(#, #)".}
  ## https://nodejs.org/api/timers.html#timers_settimeout_callback_delay_args

func setImmediate*[T](callback: T): Immediate {.importjs: "timers.$1(#)".}
  ## https://nodejs.org/api/timers.html#timers_timerspromises_setimmediate_value_options

func setInterval*[T](callback: T; delay: cint): Timeout {.importjs: "timers.$1(#, #)".}
  ## https://nodejs.org/api/timers.html#timers_setinterval_callback_delay_args

func setTimeoutPromise*(delay: cint; value: auto): Future[Timeout] {.importjs: "timersPromises.setTimeout(#, #)".}
  ## https://nodejs.org/api/timers.html#timers_timerspromises_settimeout_delay_value_options
  ## .. note:: You MUST import `timersPromises` before importing this func.

func setImmediatePromise*(value: auto): Future[Immediate] {.importjs: "timersPromises.setImmediate(#)".}
  ## https://nodejs.org/api/timers.html#timers_timerspromises_setimmediate_value_options
  ## .. note:: You MUST import `timersPromises` before using this func.

func setIntervalPromise*(delay: cint; value: auto): Future[Timeout] {.importjs: "timersPromises.setInterval(#, #)".}
  ## https://nodejs.org/api/timers.html#timers_timerspromises_setinterval_delay_value_options
  ## .. note:: You MUST import `timersPromises` before using this func.
