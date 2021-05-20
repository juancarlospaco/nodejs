from std/jsffi import JsObject

let
  allowedNodeEnvironmentFlags* {.importjs: "Array.from(process.allowedNodeEnvironmentFlags)".}: seq[cstring]
  argv* {.importjs: "process.argv".}: seq[cstring]
  argv0* {.importjs: "process.argv0".}: cstring
  debugPort* {.importjs: "process.debugPort".}: cint
  execArgv* {.importjs: "process.execArgv".}: seq[cstring]
  execPath* {.importjs: "process.execPath".}: cstring
  reportCompact* {.importjs: "process.report.compact".}: bool
  reportDirectory* {.importjs: "process.report.directory".}: cstring
  reportFilename* {.importjs: "process.report.filename".}: cstring
  reportOnFatalError* {.importjs: "process.report.reportOnFatalError".}: bool
  reportOnSignal* {.importjs: "process.report.reportOnSignal".}: bool
  reportOnUncaughtException* {.importjs: "process.report.reportOnUncaughtException".}: bool
  platform* {.importjs: "process.platform".}: cstring
  ppid* {.importjs: "process.ppid".}: cint
  processVersion* {.importjs: "process.version".}: cstring
  processVersions* {.importjs: "process.versions".}: JsObject
  config* {.importjs: "process.config".}: JsObject
  release* {.importjs: "process.release".}: JsObject

func importProcess*() {.importjs: "import * as process from 'process'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireProcess*() {.importjs: "const process = require('process')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func abort*() {.importjs: "process.$1()".}
  ## https://nodejs.org/api/process.html#process_process_abort

func chdir*(directory: cstring) {.importjs: "process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_chdir_directory

func cwd*(): cstring {.importjs: "process.$1()".}
  ## https://nodejs.org/api/process.html#process_process_cwd

func disconnect*() {.importjs: "process.$1()".}
  ## https://nodejs.org/api/process.html#process_process_disconnect

func emitWarning*(warning: cstring) {.importjs: "process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_emitwarning_warning_options

func emitWarning*(warning: cstring; tipe: cstring; code: cstring) {.importjs: "process.$1(#, #, #)".}
  ## https://nodejs.org/api/process.html#process_process_emitwarning_warning_type_code_ctor

func emitWarning*(warning: cstring; tipe: cstring) {.importjs: "process.$1(#, #)".}
  ## https://nodejs.org/api/process.html#process_process_emitwarning_warning_type_code_ctor

func exit*(code = 0.cint) {.importjs: "process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_exit_code

func getegid*(): cint {.importjs: "process.$1()".}
  ## https://nodejs.org/api/process.html#process_process_getegid

func getgroups*(): seq[cint] {.importjs: "process.$1()".}
  ## https://nodejs.org/api/process.html#process_process_getgroups

func getuid*(): cint {.importjs: "process.$1()".}
  ## https://nodejs.org/api/process.html#process_process_getuid

func hasUncaughtExceptionCaptureCallback*(): bool {.importjs: "process.$1()".}
  ## https://nodejs.org/api/process.html#process_process_hasuncaughtexceptioncapturecallback

func hrtime*(time: openArray[cint]): seq[cint] {.importjs: "process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_hrtime_time

func hrtime*(): seq[cint] {.importjs: "process.$1()".}
  ## https://nodejs.org/api/process.html#process_process_hrtime_time

func hrtimeBigint*(): cint {.importjs: "parseInt(process.hrtime.bigint())".}
  ## https://nodejs.org/api/process.html#process_process_hrtime_bigint

func initgroups*(user: cstring; extraGroup: cstring) {.importjs: "process.$1(#, #)".}
  ## https://nodejs.org/api/process.html#process_process_initgroups_user_extragroup

func initgroups*(user: cint; extraGroup: cint) {.importjs: "process.$1(#, #)".}
  ## https://nodejs.org/api/process.html#process_process_initgroups_user_extragroup

func kill*(pid: cint; signal: cint) {.importjs: "process.$1(#, #)".}
  ## https://nodejs.org/api/process.html#process_process_kill_pid_signal

func kill*(pid: cint; signal: cstring) {.importjs: "process.$1(#, #)".}
  ## https://nodejs.org/api/process.html#process_process_kill_pid_signal

func reportWriteReport*(filename: cstring): cstring {.importjs: "process.report.writeReport(#)".}
  ## https://nodejs.org/api/process.html#process_process_report_writereport_filename_err

func reportWriteReport*(): cstring {.importjs: "process.report.writeReport()".}
  ## https://nodejs.org/api/process.html#process_process_report_writereport_filename_err

func setegid*(id: cstring) {.importjs: "process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_setegid_id

func setegid*(id: cint) {.importjs: "process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_setegid_id

func seteuid*(id: cstring) {.importjs: "process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_seteuid_id

func seteuid*(id: cint) {.importjs: "process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_seteuid_id

func setgid*(id: cint) {.importjs: "process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_setgid_id

func setgid*(id: cstring) {.importjs: "process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_setgid_id

func setgroups*(groups: openArray[cint]) {.importjs: "process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_setgroups_groups

func setuid*(id: cint) {.importjs: "process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_setuid_id

func setuid*(id: cstring) {.importjs: "process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_setuid_id

func umask*(mask: cstring): any {.importjs: "process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_umask_mask

func umask*(mask: cint): any {.importjs: "process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_umask_mask

func uptimeProcess*(): cint {.importjs: "process.uptime()".}
  ## https://nodejs.org/api/process.html#process_process_uptime

func resourceUsage*(): JsObject {.importjs: "process.$1()".}

func getPid*(): cint {.importjs: "process.pid@".}

# TODO: "If Node was not spawned with an IPC channel, process.send will be undefined." ???
#
# func send*(message: JsObject): bool {.importjs: "if (process.$1 != undefined) { process.$1(#) } else { console.log('process.send is undefined')}", discardable.}
#   ## https://nodejs.org/api/process.html#process_process_send_message_sendhandle_options_callback

# func send*[T](message: JsObject; callback: T): bool {.importjs: "if (process.$1 != undefined) { process.$1(#, #) } else { console.log('process.send is undefined')}", discardable.}
#   ## https://nodejs.org/api/process.html#process_process_send_message_sendhandle_options_callback


runnableExamples: # These are computer specific can not assert them much.
  requireProcess()
  doAssert not hasUncaughtExceptionCaptureCallback()
  echo cwd()
  emitWarning("Information is power. But like all power, there are those who want to keep it for themselves".cstring)
  echo getegid()
  echo getgroups()
  echo getuid()
  echo hrtime()
  echo hrtimeBigint()
  echo reportWriteReport()
  echo uptimeProcess()
  chdir("/tmp".cstring)
  if false:
    abort()
    disconnect()
    exit(code = 0.cint)

runnableExamples("-r:off"):
  requireProcess()
  echo argv ## Read Command Line Arguments as seq[cstring]
