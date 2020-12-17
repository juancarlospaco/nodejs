
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

func jsnow*(): cint {.importjs: "perf_hooks.performance.now()".}
  ## https://nodejs.org/api/perf_hooks.html#perf_hooks_performance_now


runnableExamples:
  requirePerfhooks()
  mark()
  clearMarks()
  echo jsnow()
