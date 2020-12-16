from jsre import RegExp

func importNodeAssert*() {.importjs: "import * as node_assert from 'assert'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireNodeAssert*() {.importjs: "const node_assert = require('assert')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func deepStrictEqual*(actual: any; expected: any; message: cstring) {.importjs: "node_assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_deepstrictequal_actual_expected_message

func deepStrictEqual*(actual: any; expected: any) {.importjs: "node_assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_deepstrictequal_actual_expected_message

func doesNotMatch*(stryng: cstring; regexp: RegExp; message: cstring) {.importjs: "node_assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotmatch_string_regexp_message

func doesNotMatch*(stryng: cstring; regexp: RegExp) {.importjs: "node_assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotmatch_string_regexp_message

func doesNotReject*(asyncFunction: proc; error: RegExp; message: cstring) {.importjs: "node_assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotreject_asyncfn_error_message

func doesNotReject*(asyncFunction: proc; error: RegExp) {.importjs: "node_assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotreject_asyncfn_error_message

func doesNotReject*(asyncFunction: proc; error: proc; message: cstring) {.importjs: "node_assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotreject_asyncfn_error_message

func doesNotReject*(asyncFunction: proc; error: proc) {.importjs: "node_assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotreject_asyncfn_error_message

func doesNotThrow*(function: proc; error: RegExp; message: cstring) {.importjs: "node_assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotthrow_fn_error_message

func doesNotThrow*(function: proc; error: proc; message: cstring) {.importjs: "node_assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotthrow_fn_error_message

func doesNotThrow*(function: proc; error: RegExp) {.importjs: "node_assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotthrow_fn_error_message

func doesNotThrow*(function: proc; error: proc) {.importjs: "node_assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_doesnotthrow_fn_error_message

func strictEqual*(actual, expected: any; message: cstring) {.importjs: "node_assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_equal_actual_expected_message

func strictEqual*(actual, expected: any) {.importjs: "node_assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_equal_actual_expected_message

func ifError*(value: any) {.importjs: "node_assert.$1(#)".}
  ## https://nodejs.org/api/assert.html#assert_assert_iferror_value

func match*(stryng: cstring; regexp: RegExp; message: cstring) {.importjs: "node_assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_match_string_regexp_message

func match*(stryng: cstring; regexp: RegExp) {.importjs: "node_assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_match_string_regexp_message

func notDeepStrictEqual*(actual, expected: any; message: cstring) {.importjs: "node_assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_notdeepstrictequal_actual_expected_message

func notDeepStrictEqual*(actual, expected: any) {.importjs: "node_assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_notdeepstrictequal_actual_expected_message

func notStrictEqual*(actual, expected: any; message: cstring) {.importjs: "node_assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_notstrictequal_actual_expected_message

func notStrictEqual*(actual, expected: any) {.importjs: "node_assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_notstrictequal_actual_expected_message

func ok*(value: any; message: cstring) {.importjs: "node_assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_ok_value_message

func ok*(value: any) {.importjs: "node_assert.$1(#)".}
  ## https://nodejs.org/api/assert.html#assert_assert_ok_value_message

func rejects*(asyncFunction: proc; error: RegExp; message: cstring) {.importjs: "node_assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_rejects_asyncfn_error_message

func rejects*(asyncFunction: proc; error: RegExp) {.importjs: "node_assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_rejects_asyncfn_error_message

func rejects*(asyncFunction: proc; error: proc; message: cstring) {.importjs: "node_assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_rejects_asyncfn_error_message

func rejects*(asyncFunction: proc; error: proc) {.importjs: "node_assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_rejects_asyncfn_error_message

func throws*(asyncFunction: proc; error: RegExp; message: cstring) {.importjs: "node_assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_throws_fn_error_message

func throws*(asyncFunction: proc; error: RegExp) {.importjs: "node_assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_throws_fn_error_message

func throws*(asyncFunction: proc; error: proc; message: cstring) {.importjs: "node_assert.$1(#, #, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_throws_fn_error_message

func throws*(asyncFunction: proc; error: proc) {.importjs: "node_assert.$1(#, #)".}
  ## https://nodejs.org/api/assert.html#assert_assert_throws_fn_error_message
