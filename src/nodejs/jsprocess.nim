## NodeJS Standard Library for Nim for JavaScript Target https://nodejs.org/api/url.html
when not defined(js) and not defined(nimdoc): 
  {.fatal: "Module is designed to be used with the JavaScript backend.".}

func importNodeProcess*() {.importjs: "import * as node_process from 'process'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireNodeProcess*() {.importjs: "const node_process = require('process')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func abort*() {.importjs: "node_process.$1()".}
  ## https://nodejs.org/api/process.html#process_process_abort

func chdir*(directory: cstring) {.importjs: "node_process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_chdir_directory

func cwd*(): cstring {.importjs: "node_process.$1()".}
  ## https://nodejs.org/api/process.html#process_process_cwd

func disconnect*() {.importjs: "node_process.$1()".}
  ## https://nodejs.org/api/process.html#process_process_disconnect

func emitWarning*(warning: cstring) {.importjs: "node_process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_emitwarning_warning_options

func emitWarning*(warning: cstring; tipe: cstring; code: cstring; ctor: proc) {.importjs: "node_process.$1(#, #, #, #)".}
  ## https://nodejs.org/api/process.html#process_process_emitwarning_warning_type_code_ctor

func emitWarning*(warning: cstring; tipe: cstring; code: cstring) {.importjs: "node_process.$1(#, #, #)".}
  ## https://nodejs.org/api/process.html#process_process_emitwarning_warning_type_code_ctor

func emitWarning*(warning: cstring; tipe: cstring) {.importjs: "node_process.$1(#, #)".}
  ## https://nodejs.org/api/process.html#process_process_emitwarning_warning_type_code_ctor

func exit*(code = 0.cint) {.importjs: "node_process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_exit_code

func getegid*(): cint {.importjs: "node_process.$1()".}
  ## https://nodejs.org/api/process.html#process_process_getegid

func getgroups*(): seq[cint] {.importjs: "node_process.$1()".}
  ## https://nodejs.org/api/process.html#process_process_getgroups

func getuid*(): cint {.importjs: "node_process.$1()".}
  ## https://nodejs.org/api/process.html#process_process_getuid

func hasUncaughtExceptionCaptureCallback*(): bool {.importjs: "node_process.$1()".}
  ## https://nodejs.org/api/process.html#process_process_hasuncaughtexceptioncapturecallback

func hrtime*(time: openArray[cint]): seq[cint] {.importjs: "node_process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_hrtime_time

func hrtime*(): seq[cint] {.importjs: "node_process.$1()".}
  ## https://nodejs.org/api/process.html#process_process_hrtime_time

func hrtimeBigint*(): cstring {.importjs: "node_process.hrtime.bigint()".}
  ## https://nodejs.org/api/process.html#process_process_hrtime_bigint

func initgroups*(user: cstring; extraGroup: cstring) {.importjs: "node_process.$1(#, #)".}
  ## https://nodejs.org/api/process.html#process_process_initgroups_user_extragroup

func initgroups*(user: cint; extraGroup: cint) {.importjs: "node_process.$1(#, #)".}
  ## https://nodejs.org/api/process.html#process_process_initgroups_user_extragroup

func kill*(pid: cint; signal: cint) {.importjs: "node_process.$1(#, #)".}
  ## https://nodejs.org/api/process.html#process_process_kill_pid_signal

func kill*(pid: cint; signal: cstring) {.importjs: "node_process.$1(#, #)".}
  ## https://nodejs.org/api/process.html#process_process_kill_pid_signal

func nextTick*(callback: proc; args: any) {.importjs: "node_process.$1(#, @)", varargs.}
  ## https://nodejs.org/api/process.html#process_process_nexttick_callback_args

func nextTick*(callback: proc) {.importjs: "node_process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_nexttick_callback_args

func reportWriteReport*(filename: cstring): cstring {.importjs: "node_process.report.writeReport(#)".}
  ## https://nodejs.org/api/process.html#process_process_report_writereport_filename_err

func reportWriteReport*(): cstring {.importjs: "node_process.report.writeReport()".}
  ## https://nodejs.org/api/process.html#process_process_report_writereport_filename_err

func send*(message: cstring; callback: proc): bool {.importjs: "node_process.$1(#, #)".}
  ## https://nodejs.org/api/process.html#process_process_send_message_sendhandle_options_callback

func send*(message: cstring): bool {.importjs: "node_process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_send_message_sendhandle_options_callback

func setegid*(id: cstring) {.importjs: "node_process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_setegid_id

func setegid*(id: cint) {.importjs: "node_process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_setegid_id

func seteuid*(id: cstring) {.importjs: "node_process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_seteuid_id

func seteuid*(id: cint) {.importjs: "node_process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_seteuid_id

func setgid*(id: cint) {.importjs: "node_process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_setgid_id

func setgid*(id: cstring) {.importjs: "node_process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_setgid_id

func setgroups*(groups: openArray[cint]) {.importjs: "node_process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_setgroups_groups

func setuid*(id: cint) {.importjs: "node_process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_setuid_id

func setuid*(id: cstring) {.importjs: "node_process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_setuid_id

func setUncaughtExceptionCaptureCallback*(function: proc) {.importjs: "node_process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_setuncaughtexceptioncapturecallback_fn

func umask*(mask: cstring): any {.importjs: "node_process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_umask_mask

func umask*(mask: cint): any {.importjs: "node_process.$1(#)".}
  ## https://nodejs.org/api/process.html#process_process_umask_mask

func uptime*(): cint {.importjs: "node_process.$1()".}
  ## https://nodejs.org/api/process.html#process_process_uptime
