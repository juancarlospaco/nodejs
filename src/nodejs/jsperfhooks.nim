
let
  NODE_PERFORMANCE_GC_MAJOR* {.importjs: "perf_hooks.constants.NODE_PERFORMANCE_GC_MAJOR".}: cint
  NODE_PERFORMANCE_GC_MINOR* {.importjs: "perf_hooks.constants.NODE_PERFORMANCE_GC_MINOR".}: cint
  NODE_PERFORMANCE_GC_INCREMENTAL* {.importjs: "perf_hooks.constants.NODE_PERFORMANCE_GC_INCREMENTAL".}: cint
  NODE_PERFORMANCE_GC_WEAKCB* {.importjs: "perf_hooks.constants.NODE_PERFORMANCE_GC_WEAKCB".}: cint
  NODE_PERFORMANCE_GC_FLAGS_NO* {.importjs: "perf_hooks.constants.NODE_PERFORMANCE_GC_FLAGS_NO".}: cint
  NODE_PERFORMANCE_GC_FLAGS_CONSTRUCT_RETAINED* {.importjs: "perf_hooks.constants.NODE_PERFORMANCE_GC_FLAGS_CONSTRUCT_RETAINED".}: cint
  NODE_PERFORMANCE_GC_FLAGS_FORCED* {.importjs: "perf_hooks.constants.NODE_PERFORMANCE_GC_FLAGS_FORCED".}: cint
  NODE_PERFORMANCE_GC_FLAGS_SYNCHRONOUS_PHANTOM_PROCESSING* {.importjs: "perf_hooks.constants.NODE_PERFORMANCE_GC_FLAGS_SYNCHRONOUS_PHANTOM_PROCESSING".}: cint
  NODE_PERFORMANCE_GC_FLAGS_ALL_AVAILABLE_GARBAGE* {.importjs: "perf_hooks.constants.NODE_PERFORMANCE_GC_FLAGS_ALL_AVAILABLE_GARBAGE".}: cint
  NODE_PERFORMANCE_GC_FLAGS_ALL_EXTERNAL_MEMORY* {.importjs: "perf_hooks.constants.NODE_PERFORMANCE_GC_FLAGS_ALL_EXTERNAL_MEMORY".}: cint
  NODE_PERFORMANCE_GC_FLAGS_SCHEDULE_IDLE* {.importjs: "perf_hooks.constants.NODE_PERFORMANCE_GC_FLAGS_SCHEDULE_IDLE".}: cint

func importPerfhooks*() {.importjs: "import * as perf_hooks from 'perf_hooks'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requirePerfhooks*() {.importjs: "const perf_hooks = require('perf_hooks')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func clearMarks*() {.importjs: "perf_hooks.performance.$1()".}
  ## https://nodejs.org/api/perf_hooks.html#perf_hooks_performance_clearmarks_name

func clearMarks*(name: cstring) {.importjs: "perf_hooks.performance.$1(#)".}
  ## https://nodejs.org/api/perf_hooks.html#perf_hooks_performance_clearmarks_name

func mark*() {.importjs: "perf_hooks.performance.$1()".}
  ## https://nodejs.org/api/perf_hooks.html#perf_hooks_performance_mark_name

func mark*(name: cstring) {.importjs: "perf_hooks.performance.$1(#)".}
  ## https://nodejs.org/api/perf_hooks.html#perf_hooks_performance_mark_name

func measure*(name: cstring; ) {.importjs: "perf_hooks.performance.$1(#)".}
  ## https://nodejs.org/api/perf_hooks.html#perf_hooks_performance_measure_name_startmark_endmark

func measure*(name, startMark, endMark: cstring) {.importjs: "perf_hooks.performance.$1(#, #, #)".}
  ## https://nodejs.org/api/perf_hooks.html#perf_hooks_performance_measure_name_startmark_endmark

func jsnow*(): cint {.importjs: "(perf_hooks.performance.now() || 0)".}
  ## https://nodejs.org/api/perf_hooks.html#perf_hooks_performance_now


runnableExamples:
  requirePerfhooks()
  mark()
  clearMarks()
  echo jsnow()
