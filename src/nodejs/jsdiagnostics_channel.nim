type Channel* = ref object of JsRoot ## https://nodejs.org/api/diagnostics_channel.html#diagnostics_channel_class_channel
  hasSubscribers*: bool  ## https://nodejs.org/api/diagnostics_channel.html#diagnostics_channel_channel_hassubscribers

func importDiagnosticsChannel*() {.importjs: "import * as diagnostics_channel from 'diagnostics_channel'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireDiagnosticsChannel*() {.importjs: "const diagnostics_channel = require('diagnostics_channel')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func newChannel*(name: cstring): Channel {.importjs: "#.channel()".}
  ## https://nodejs.org/api/diagnostics_channel.html#diagnostics_channel_diagnostics_channel_hassubscribers_name

func hasSubscribers*(name: cstring): bool {.importjs: "(diagnostics_channel.$1(#) || false)".}
  ## https://nodejs.org/api/diagnostics_channel.html#diagnostics_channel_diagnostics_channel_hassubscribers_name

func publish*(self: Channel; message: auto): bool {.importjs: "(#.$1(#) || false)".}
  ## https://nodejs.org/api/diagnostics_channel.html#diagnostics_channel_channel_publish_message

func subscribe*[T](self: Channel; onMessage: T) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/diagnostics_channel.html#diagnostics_channel_channel_subscribe_onmessage

func unsubscribe*[T](self: Channel; onMessage: T) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/diagnostics_channel.html#diagnostics_channel_channel_unsubscribe_onmessage
