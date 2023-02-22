## `sequtils` like ops but optimized for JavaScript.
## * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#static_methods
##
## See also:
## * https://dev.to/mohitkumartoshniwal/most-used-javascript-methods-i-use-in-my-day-to-day-job-613
## * https://souravsarkaremon16.medium.com/most-used-methods-in-javascript-7742b6df1844
## * https://dev.to/zahab/top-40-javascript-methods-you-must-know-fj5#es6


func at*[T](self: openArray[T]; index: SomeInteger): T {.importjs: "#.$1(#)".} =
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/at
  runnableExamples"-b:js -r:off":
    const array1 = [5, 12, 8, 130, 44]
    doAssert array1.at(2) == 8
    doAssert array1.at(-2) == 130  ## Index can be negative.


func concat*[T](self, other: seq[T]): seq[T] {.importjs: "(#.$1(#) || [])".} =
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/at
  runnableExamples"-b:js":
    const array1 = @['a', 'b', 'c']
    const array2 = @['d', 'e', 'f']
    let array3 = array1.concat(array2)
    doAssert array1.concat(array2) == @['a', 'b', 'c', 'd', 'e', 'f']


func every*[T](self: openArray[T]; callbackFn: proc(element: T; index: Natural): bool): bool {.importjs: "(#.$1(#) || false)".}
func every*[T](self: openArray[T]; callbackFn: proc(element: T): bool): bool {.importjs: "(#.$1(#) || false)".}
func every*[T](self: openArray[T]; callbackFn: proc(): bool): bool {.importjs: "(#.$1(#) || false)".} =
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every


func fill*[T](self: openArray[T]; value: auto): seq[T] {.importjs: "(#.$1(#) || [])".}
func fill*[T](self: openArray[T]; value: auto; start: Natural): seq[T] {.importjs: "(#.$1(#, #) || [])".}
func fill*[T](self: openArray[T]; value: auto; start: Natural; ends: Positive): seq[T] {.importjs: "(#.$1(#, #, #) || [])".} =
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/fill


func flat*[T](self: openArray[T]): seq[T] {.importjs: "(#.$1() || [])".}
func flat*[T](self: openArray[T]; depth: Positive): seq[T] {.importjs: "(#.$1(#) || [])".} =
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/flat


func flatMap*[T](self: openArray[T]; callbackFn: proc(element: T; index: Natural): bool): seq[auto] {.importjs: "(#.$1(#) || [])".}
func flatMap*[T](self: openArray[T]; callbackFn: proc(element: T): bool): seq[auto] {.importjs: "(#.$1(#) || [])".}
func flatMap*[T](self: openArray[T]; callbackFn: proc(): bool): seq[auto] {.importjs: "(#.$1(#) || [])".} =
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/flatMap


func forEach*[T](self: openArray[T]; callbackFn: proc(element: T; index: Natural): bool): seq[auto] {.importjs: "(#.$1(#) || [])".}
func forEach*[T](self: openArray[T]; callbackFn: proc(element: T): bool): seq[auto] {.importjs: "(#.$1(#) || [])".}
func forEach*[T](self: openArray[T]; callbackFn: proc(): bool): seq[auto] {.importjs: "(#.$1(#) || [])".} =
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach


func group*[T](self: openArray[T]; callbackFn: proc(element: T; index: Natural): bool): auto {.importjs: "(#.$1(#) || {})".}
func group*[T](self: openArray[T]; callbackFn: proc(element: T): bool): auto {.importjs: "(#.$1(#) || {})".}
func group*[T](self: openArray[T]; callbackFn: proc(): bool): auto {.importjs: "(#.$1(#) || {})".} =
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/group


func groupToMap*[T](self: openArray[T]; callbackFn: proc(element: T; index: Natural): bool): auto {.importjs: "(#.$1(#) || {})".}
func groupToMap*[T](self: openArray[T]; callbackFn: proc(element: T): bool): auto {.importjs: "(#.$1(#) || {})".}
func groupToMap*[T](self: openArray[T]; callbackFn: proc(): bool): auto {.importjs: "(#.$1(#) || {})".} =
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/groupToMap


func isArray*[T](self: openArray[T]; value: auto): bool {.importjs: "(#.$1(#) || false)".} =
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/isArray


func lastIndexOf*[T](self: openArray[T]; searchElement: T): int {.importjs: "(#.$1(#) || -1)".}
func lastIndexOf*[T](self: openArray[T]; searchElement: T; fromIndex: Natural): int {.importjs: "(#.$1(#, #) || -1)".} =
  ## https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/lastIndexOf
