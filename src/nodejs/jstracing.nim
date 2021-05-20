from std/jsffi import JsObject

type Tracing* = ref object of JsRoot ## https://nodejs.org/api/tracing.html#tracing_tracing_object
  categories*: cstring  ## https://nodejs.org/api/tracing.html#tracing_tracing_categories

func importTracing*() {.importjs: "import * as trace_events from 'trace_events'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireTracing*() {.importjs: "const trace_events = require('trace_events')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func newTracing*(options: JsObject): Tracing {.importjs: "trace_events.createTracing(#)".}
  ## https://nodejs.org/api/tracing.html#tracing_trace_events_createtracing_options

func disable*(self: Tracing) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/tracing.html#tracing_tracing_disable

func enable*(self: Tracing) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/tracing.html#tracing_tracing_enable

func getEnabledCategories*(): cstring {.importjs: "trace_events.$1()".}
  ## https://nodejs.org/api/tracing.html#tracing_trace_events_getenabledcategories
