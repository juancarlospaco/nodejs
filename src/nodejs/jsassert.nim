from std/jsre import RegExp
from std/jsffi import JsObject

type CallTracker* = ref object of JsRoot  ## https://nodejs.org/api/assert.html#assert_class_assert_calltracker

func newCallTracker*(): CallTracker {.importjs: "(new assert.CallTracker())".}
  ## https://nodejs.org/api/assert.html#assert_new_assert_calltracker

func calls*[T](self: CallTracker; fn: T; exact = 1.cint): T {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_tracker_calls_fn_exact

func report*(self: CallTracker): JsObject {.importjs: "#.$1()".}
  ## https://nodejs.org/api/assert.html#assert_tracker_report

func verify*(self: CallTracker) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/assert.html#assert_tracker_verify

func importAssert*() {.importjs: "import * as assert from 'assert'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireAssert*() {.importjs: "const assert = require('assert')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func requireAssertStrict*() {.importjs: "const assert = require('assert').strict@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func newAssertionError*(): cstring {.importjs: "JSON.stringify(new assert.AssertionError({}))".}
  ## https://nodejs.org/api/assert.html#assert_new_assert_assertionerror_options

func newAssertionError*(message: cstring; actual: auto; expected: auto; operator: cstring): cstring {.importjs:
  "JSON.stringify(new assert.AssertionError({message: #, actual: #, expected: #, operator: #}))".}
  ## https://nodejs.org/api/assert.html#assert_new_assert_assertionerror_options

func deepStrictEqual*(actual: auto; expected: auto; message: cstring) {.importjs: "assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_deepstrictequal_actual_expected_message

func deepStrictEqual*(actual: auto; expected: auto) {.importjs: "assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_deepstrictequal_actual_expected_message

func doesNotMatch*(stryng: cstring; regexp: RegExp; message: cstring) {.importjs: "assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotmatch_string_regexp_message

func doesNotMatch*(stryng: cstring; regexp: RegExp) {.importjs: "assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotmatch_string_regexp_message

func doesNotReject*[T](asyncFunction: T; error: RegExp; message: cstring) {.importjs: "assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotreject_asyncfn_error_message

func doesNotReject*[T](asyncFunction: T; error: RegExp) {.importjs: "assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotreject_asyncfn_error_message

func doesNotReject*[T](asyncFunction: T; error: T; message: cstring) {.importjs: "assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotreject_asyncfn_error_message

func doesNotReject*[T](asyncFunction: T; error: T) {.importjs: "assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotreject_asyncfn_error_message

func doesNotThrow*[T](function: T; error: RegExp; message: cstring) {.importjs: "assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotthrow_fn_error_message

func doesNotThrow*[T](function: T; error: T; message: cstring) {.importjs: "assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotthrow_fn_error_message

func doesNotThrow*[T](function: T; error: RegExp) {.importjs: "assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotthrow_fn_error_message

func doesNotThrow*[T](function: T; error: T) {.importjs: "assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotthrow_fn_error_message

func strictEqual*(actual, expected: auto; message: cstring) {.importjs: "assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_equal_actual_expected_message

func strictEqual*(actual, expected: auto) {.importjs: "assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_equal_actual_expected_message

func ifError*(value: auto) {.importjs: "assert.$1(#)".}
  ## https://nodejs.org/api/assert.html#assert_assert_iferror_value

func match*(stryng: cstring; regexp: RegExp; message: cstring) {.importjs: "assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_match_string_regexp_message

func match*(stryng: cstring; regexp: RegExp) {.importjs: "assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_match_string_regexp_message

func notDeepStrictEqual*(actual, expected: auto; message: cstring) {.importjs: "assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_notdeepstrictequal_actual_expected_message

func notDeepStrictEqual*(actual, expected: auto) {.importjs: "assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_notdeepstrictequal_actual_expected_message

func notStrictEqual*(actual, expected: auto; message: cstring) {.importjs: "assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_notstrictequal_actual_expected_message

func notStrictEqual*(actual, expected: auto) {.importjs: "assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_notstrictequal_actual_expected_message

func ok*(value: auto; message: cstring) {.importjs: "assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_ok_value_message

func ok*(value: auto) {.importjs: "assert.$1(#)".}
  ## https://nodejs.org/api/assert.html#assert_assert_ok_value_message

func rejects*[T](asyncFunction: T; error: RegExp; message: cstring) {.importjs: "assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_rejects_asyncfn_error_message

func rejects*[T](asyncFunction: T; error: RegExp) {.importjs: "assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_rejects_asyncfn_error_message

func rejects*[T](asyncFunction: T; error: T; message: cstring) {.importjs: "assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_rejects_asyncfn_error_message

func rejects*[T](asyncFunction: T; error: T) {.importjs: "assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_rejects_asyncfn_error_message

func throws*[T](asyncFunction: T; error: RegExp; message: cstring) {.importjs: "assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_throws_fn_error_message

func throws*[T](asyncFunction: T; error: RegExp) {.importjs: "assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_throws_fn_error_message

func throws*[T](asyncFunction: T; error: T; message: cstring) {.importjs: "assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_throws_fn_error_message

func throws*[T](asyncFunction: T; error: T) {.importjs: "assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_throws_fn_error_message

func toCstring*(self: CallTracker): cstring {.importjs: "JSON.stringify(#)".}

func `$`*(self: CallTracker): string = $toCstring(self)


runnableExamples:
  import std/[jsffi, jsre]
  requireAssert()
  block:
    let tracker: CallTracker = newCallTracker()
    doAssert tracker.report() is JsObject
    tracker.verify()
  block:
    doAssert newAssertionError() == """{"generatedMessage":true,"code":"ERR_ASSERTION"}""".cstring
    doAssert newAssertionError("message".cstring, 1.cint, 2.cint, "strictEqual".cstring) == """{"generatedMessage":false,"code":"ERR_ASSERTION","actual":1,"expected":2,"operator":"strictEqual"}""".cstring
    deepStrictEqual(42.cint, 42.cint, "message".cstring)
    notDeepStrictEqual(666.cint, 42.cint, "message".cstring)
    strictEqual(666.cint, 666.cint, "message".cstring)
    ok(true, "message".cstring)
    let rege: RegExp = newRegExp("[0-9]", "i")
    doesNotMatch("abcde".cstring, rege, "message".cstring)
