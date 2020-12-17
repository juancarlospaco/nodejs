
func importV8*() {.importjs: "import * as v8 from 'v8'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireV8*() {.importjs: "const v8 = require('v8')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func cachedDataVersionTag*(): cint {.importjs: "v8.$1()".}
  ## https://nodejs.org/api/v8.html#v8_v8_cacheddataversiontag

func setFlagsFromString*(flags: cstring) {.importjs: "v8.$1()".}
  ## https://nodejs.org/api/v8.html#v8_v8_setflagsfromstring_flags

func takeCoverage*() {.importjs: "v8.$1()".}
  ## https://nodejs.org/api/v8.html#v8_v8_takecoverage

func stopCoverage*() {.importjs: "v8.$1()".}
  ## https://nodejs.org/api/v8.html#v8_v8_stopcoverage

func writeHeapSnapshot*(filename: cstring): cstring {.importjs: "v8.$1(#)".}
  ## https://nodejs.org/api/v8.html#v8_v8_writeheapsnapshot_filename


runnableExamples:
  requireV8()
  doAssert cachedDataVersionTag() is cint
  # takeCoverage()
  # stopCoverage()
  echo writeHeapSnapshot("file.txt".cstring)
