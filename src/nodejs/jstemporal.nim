## * `Temporal` date and time API for JavaScript targets.
##
## .. Warning:: See https://caniuse.com/temporal
import std/[jsffi, jsbigints]

type
  TemporalTimeZoneProtocol* {.importjs: "Temporal.TimeZoneProtocol".} = object
  TemporalNow*              {.importjs: "Temporal.Now"             .} = object

  TemporalInstant* {.importjs: "Temporal.Instant".} = object
    epochSeconds*, epochMilliseconds*: cint
    epochMicroseconds*, epochNanoseconds*: JsBigInt

  TemporalZonedDateTime* {.importjs: "Temporal.ZonedDateTime".} = object
    year*, month*, day*, hour*, minute*, second*, millisecond*, microsecond*: cint
    nanosecond*, epochSeconds*, epochMilliseconds*, eraYear*, dayOfWeek*, dayOfYear*: cint
    weekOfYear*, daysInWeek*, daysInMonth*, daysInYear*, monthsInYear*, hoursInDay*, offsetNanoseconds* : cint
    epochMicroseconds*, epochNanoseconds*: JsBigInt
    monthCode*, era*, offset*: cstring
    calendar*: JsObject
    timeZone*: TemporalTimeZoneProtocol
    inLeapYear*: bool

  TemporalPlainDate* {.importjs: "Temporal.PlainDate".} = object
    year*, month*, day*: cint
    eraYear*, dayOfWeek*, dayOfYear*: cint
    weekOfYear*, daysInWeek*, daysInMonth*, daysInYear*, monthsInYear*, hoursInDay*: cint
    monthCode*, era*: cstring
    calendar*: JsObject
    inLeapYear*: bool

  TemporalPlainTime* {.importjs: "Temporal.PlainTime".} = object
    hour*, minute*, second*, millisecond*, microsecond*, nanosecond*, epochSeconds*, epochMilliseconds*, offsetNanoseconds*: cint
    epochMicroseconds*, epochNanoseconds*: JsBigInt
    offset*: cstring
    calendar*: TemporalCalendar

  TemporalPlainDateTime* {.importjs: "Temporal.PlainDateTime".} = object
    year*, month*, day*, hour*, minute*, second*, millisecond*, microsecond*: cint
    nanosecond*, epochSeconds*, epochMilliseconds*, eraYear*, dayOfWeek*, dayOfYear*: cint
    weekOfYear*, daysInWeek*, daysInMonth*, daysInYear*, monthsInYear*, hoursInDay*, offsetNanoseconds* : cint
    epochMicroseconds*, epochNanoseconds*: JsBigInt
    monthCode*, era*, offset*: cstring
    calendar*: JsObject
    inLeapYear*: bool

  TemporalDuration* {.importjs: "Temporal.Duration".} = object
    years*, months*, days*, hours*, minutes*, seconds*, milliseconds*, microseconds*, sign*, nanoseconds*: cint
    blank*: bool

  TemporalTimeZone* {.importjs: "Temporal.TimeZone".} = object
    id*: cstring

  TemporalCalendar* {.importjs: "Temporal.Calendar".} = object
    id*: cstring

func zonedDateTimeISO*(self: TemporalNow; timeZone: cstring or JsObject): TemporalZonedDateTime {.importjs: "#.$1(#)".}
func zonedDateTime*(self: TemporalNow; calendar: cstring or JsObject; timeZone: cstring or JsObject): TemporalZonedDateTime {.importjs: "#.$1(#, #)".}
func instant*(self: TemporalNow): TemporalInstant {.importjs: "#.$1()".}
func timeZone*(self: TemporalNow): TemporalTimeZone {.importjs: "#.$1()".}
func plainDateTimeISO*(self: TemporalNow; timeZone: cstring or JsObject): TemporalPlainDateTime {.importjs: "#.$1(#)".}
func plainDateTime*(self: TemporalNow; calendar, timeZone: cstring or JsObject): TemporalPlainDateTime {.importjs: "#.$1(#)".}
func plainDateISO*(self: TemporalNow; timeZone: cstring or JsObject): TemporalPlainDate {.importjs: "#.$1(#)".}
func plainDate*(self: TemporalNow; calendar, timeZone: cstring or JsObject): TemporalPlainDate {.importjs: "#.$1(#)".}
func plainTimeISO*(self: TemporalNow; timeZone: cstring or JsObject): TemporalPlainDate {.importjs: "#.$1(#)".}
func newTemporalInstant*(epochNanoseconds: JsBigInt): TemporalInstant {.importjs: "(new Temporal.Instant(#))".}
func newTemporalInstant*(thing: auto): TemporalInstant {.importjs: "Temporal.Instant.from(#)".}
func fromEpochSeconds*(epochSeconds: cint or float): TemporalInstant {.importjs: "Temporal.Instant.fromEpochSeconds(#)".}
func fromEpochMilliseconds*(epochMilliseconds: cint or float): TemporalInstant {.importjs: "Temporal.Instant.fromEpochMilliseconds(#)".}
func fromEpochMicroseconds*(epochMicroseconds: JsBigInt): TemporalInstant {.importjs: "Temporal.Instant.fromEpochMicroseconds(#)".}
func fromEpochNanoseconds*(epochNanoseconds: JsBigInt): TemporalInstant {.importjs: "Temporal.Instant.fromEpochNanoseconds(#)".}
func compare*(a, b: TemporalInstant): cint {.importjs: "Temporal.Instant.compare(#, #)".}
func compare*(a, b: TemporalZonedDateTime): cint {.importjs: "Temporal.ZonedDateTime.compare(#, #)".}
func `<`*(a, b: TemporalZonedDateTime): bool {.importjs: "(Temporal.ZonedDateTime.compare(#, #) === -1)".}
func `<`*(a, b: TemporalInstant): bool {.importjs: "(Temporal.Instant.compare(#, #) === -1)".}
func toZonedDateTimeISO*(self: TemporalInstant; timeZone: cstring or JsObject): TemporalZonedDateTime {.importjs: "#.$1(#)".}
func toZonedDateTime*(self: TemporalInstant or TemporalPlainDate or TemporalPlainTime or TemporalPlainDateTime; timeZone: JsObject): TemporalZonedDateTime {.importjs: "#.$1(#)".}
func add*(self: TemporalInstant; duration: cstring or JsObject or TemporalDuration): TemporalInstant {.importjs: "#.$1(#)".}
func subtract*(self: TemporalInstant; duration: cstring or JsObject or TemporalDuration): TemporalInstant {.importjs: "#.$1(#)".}
func until*(self: TemporalInstant or TemporalZonedDateTime or TemporalPlainDate or TemporalPlainTime or TemporalPlainDateTime; other: cstring or TemporalInstant or TemporalZonedDateTime or TemporalPlainDate or TemporalPlainTime or TemporalPlainDateTime): TemporalDuration {.importjs: "#.$1(#)".}
func since*(self, other: TemporalInstant or TemporalZonedDateTime or TemporalPlainDate or TemporalPlainTime): TemporalDuration {.importjs: "#.$1(#)".}
func round*(self: TemporalInstant; options: JsObject): TemporalInstant {.importjs: "#.$1(#)".}
func `==`*(a, b: TemporalInstant): bool {.importjs: "#.equals(#)".}
func toCstring*(self: TemporalInstant or TemporalZonedDateTime or TemporalPlainDate or TemporalPlainTime or TemporalPlainDateTime or TemporalDuration or TemporalTimeZone; options: JsObject): cstring {.importjs: "#.toString(#)".}
func toCstring*(self: TemporalInstant or TemporalZonedDateTime or TemporalPlainDate or TemporalPlainTime or TemporalPlainDateTime or TemporalDuration or TemporalTimeZone): cstring {.importjs: "#.toString()".}
func toLocaleString*(self: TemporalInstant or TemporalZonedDateTime or TemporalPlainDate or TemporalPlainTime or TemporalPlainDateTime or TemporalDuration; locales: cstring or seq[string]; options: JsObject): cstring {.importjs: "#.$1(#, #)".}
func toLocaleString*(self: TemporalInstant or TemporalZonedDateTime or TemporalPlainDate or TemporalPlainTime or TemporalPlainDateTime or TemporalDuration; locales: cstring or seq[string]): cstring {.importjs: "#.$1(#)".}
func toLocaleString*(self: TemporalInstant or TemporalZonedDateTime or TemporalPlainDate or TemporalPlainTime or TemporalPlainDateTime or TemporalDuration): cstring {.importjs: "#.$1()".}
func toJSON*(self: TemporalInstant or TemporalZonedDateTime or TemporalPlainDate or TemporalPlainTime or TemporalPlainDateTime or TemporalDuration or TemporalTimeZone): cstring {.importjs: "#.$1()".}
func `$`*(self: TemporalInstant or TemporalZonedDateTime or TemporalPlainTime or TemporalPlainDateTime): string = $toCstring(self)
func newTemporalZonedDateTime*(epochNanoseconds: JsBigInt; timeZone, calendar: cstring or JsObject): TemporalZonedDateTime {.importjs: "(new Temporal.ZonedDateTime(#, #, #))".}
func newTemporalZonedDateTime*(epochNanoseconds: JsBigInt; timeZone: cstring or JsObject): TemporalZonedDateTime {.importjs: "(new Temporal.ZonedDateTime(#, #))".}
func newTemporalZonedDateTime*(thing: auto; options: JsObject): TemporalZonedDateTime {.importjs: "(Temporal.ZonedDateTime.from((#, #))".}
func newTemporalZonedDateTime*(thing: auto): TemporalZonedDateTime {.importjs: "(Temporal.ZonedDateTime.from((#))".}
func with*(self: TemporalZonedDateTime; zonedDateTimeLike: cstring or JsObject; options: JsObject): TemporalZonedDateTime {.importjs: "#.$1(#, #)".}
func with*(self: TemporalZonedDateTime; zonedDateTimeLike: cstring or JsObject): TemporalZonedDateTime {.importjs: "#.$1(#)".}
func withPlainTime*(self: TemporalZonedDateTime or TemporalPlainDateTime; plainTime: cstring or JsObject): TemporalPlainDateTime {.importjs: "#.$1(#)".}
func withPlainTime*(self: TemporalZonedDateTime or TemporalPlainDateTime): TemporalPlainDateTime {.importjs: "#.$1()".}
func withPlainDate*(self: TemporalZonedDateTime or TemporalPlainDateTime; plainDate: cstring or JsObject): TemporalPlainDateTime {.importjs: "#.$1(#)".}
func withTimeZone*(self: TemporalZonedDateTime; timeZone: cstring or JsObject): TemporalZonedDateTime {.importjs: "#.$1(#)".}
func withCalendar*(self: TemporalZonedDateTime; calendar: cstring or JsObject): TemporalZonedDateTime {.importjs: "#.$1(#)".}
func add*(self: TemporalZonedDateTime; duration, options: JsObject): TemporalZonedDateTime {.importjs: "#.$1(#, #)".}
func add*(self: TemporalZonedDateTime; duration: JsObject): TemporalZonedDateTime {.importjs: "#.$1(#)".}
func subtract*(self: TemporalZonedDateTime; duration, options: JsObject): TemporalZonedDateTime {.importjs: "#.$1(#, #)".}
func subtract*(self: TemporalZonedDateTime; duration: JsObject): TemporalZonedDateTime {.importjs: "#.$1(#)".}
func round*(self: TemporalZonedDateTime; options: JsObject): TemporalZonedDateTime {.importjs: "#.$1(#)".}
func `==`*(a, b: TemporalZonedDateTime): bool {.importjs: "#.equals(#)".}
func toInstant*(self: TemporalZonedDateTime): TemporalInstant {.importjs: "#.$1()".}
func toPlainDate*(self: TemporalZonedDateTime or TemporalPlainDateTime): TemporalPlainDate {.importjs: "#.$1()".}
func toPlainTime*(self: TemporalZonedDateTime or TemporalPlainDateTime): TemporalPlainTime {.importjs: "#.$1()".}
func toPlainDateTime*(self: TemporalZonedDateTime or TemporalPlainDate or TemporalPlainTime): TemporalPlainDateTime {.importjs: "#.$1()".}
func getISOFields*(self: TemporalZonedDateTime or TemporalPlainDate or TemporalPlainTime or TemporalPlainDateTime): JsObject {.importjs: "#.$1()".}
func newTemporalPlainDate*(isoYear, isoMonth, isoDay: cint; calendar: cstring or JsObject): TemporalPlainDate {.importjs: "(new Temporal.PlainDate(#, #, #, #))".}
func newTemporalPlainDate*(isoYear, isoMonth, isoDay: cint): TemporalPlainDate {.importjs: "(new Temporal.PlainDate(#, #, #))".}
func newTemporalPlainDate*(thing: auto; options: JsObject): TemporalPlainDate {.importjs: "Temporal.PlainDate.from(#, #)".}
func newTemporalPlainDate*(thing: auto): TemporalPlainDate {.importjs: "Temporal.PlainDate.from(#)".}
func compare*(a, b: TemporalPlainDate): cint {.importjs: "Temporal.PlainDate.compare(#, #)".}
func with*(self: TemporalPlainDate; dateLike: cstring or JsObject; options: JsObject): TemporalPlainDate {.importjs: "#.$1(#, #)".}
func with*(self: TemporalPlainDate; dateLike: cstring or JsObject): TemporalPlainDate {.importjs: "#.$1(#)".}
func withCalendar*(self: TemporalPlainDate; calendar: cstring or JsObject): TemporalPlainDate {.importjs: "#.$1(#)".}
func add*(self: TemporalPlainDate; duration, options: cstring or JsObject or TemporalDuration): TemporalPlainDate {.importjs: "#.$1(#, #)".}
func add*(self: TemporalPlainDate; duration: cstring or JsObject or TemporalDuration): TemporalPlainDate {.importjs: "#.$1(#)".}
func subtract*(self: TemporalPlainDate; duration, options: cstring or JsObject or TemporalDuration): TemporalPlainDate {.importjs: "#.$1(#, #)".}
func subtract*(self: TemporalPlainDate; duration: cstring or JsObject or TemporalDuration): TemporalPlainDate {.importjs: "#.$1(#)".}
func `==`*(a, b: TemporalPlainDate): bool {.importjs: "#.equals(#)".}
func newTemporalPlainTime*(isoHour, isoMinute, isoSecond, isoMillisecond, isoMicrosecond, isoNanosecond: cint = 0): TemporalPlainTime {.importjs: "(new Temporal.PlainTime(#, #, #, #, #, #))".}
func newTemporalPlainTime*(thing: auto; options: JsObject): TemporalPlainTime {.importjs: "Temporal.PlainTime.from(#, #)".}
func newTemporalPlainTime*(thing: auto): TemporalPlainTime {.importjs: "Temporal.PlainTime.from(#)".}
func compare*(a, b: TemporalPlainTime): cint {.importjs: "Temporal.TemporalPlainTime.compare(#, #)".}
func with*(self: TemporalPlainTime; dateLike: cstring or JsObject; options: JsObject): TemporalPlainTime {.importjs: "#.$1(#, #)".}
func with*(self: TemporalPlainTime; dateLike: cstring or JsObject): TemporalPlainTime {.importjs: "#.$1(#)".}
func add*(self: TemporalPlainTime; duration: cstring or JsObject or TemporalDuration): TemporalPlainTime {.importjs: "#.$1(#)".}
func subtract*(self: TemporalPlainTime; duration: cstring or JsObject or TemporalDuration): TemporalPlainTime {.importjs: "#.$1(#, #)".}
func round*(self: TemporalPlainTime; options: JsObject): TemporalPlainTime {.importjs: "#.$1(#)".}
func `==`*(a, b: TemporalPlainTime): bool {.importjs: "#.equals(#)".}
func newTemporalPlainDateTime*(isoYear, isoMonth, isoDay, isoHour, isoMinute, isoSecond, isoMillisecond, isoMicrosecond, isoNanosecond: cint = 0; calendar: cstring or JsObject): TemporalPlainDateTime {.importjs: "#.$1(#, #, #, #, #, #, #, #, #, #)".}
func newTemporalPlainDateTime*(isoYear, isoMonth, isoDay, isoHour, isoMinute, isoSecond, isoMillisecond, isoMicrosecond, isoNanosecond: cint = 0): TemporalPlainDateTime {.importjs: "#.$1(#, #, #, #, #, #, #, #, #)".}
func newTemporalPlainDateTime*(thing: auto; options: JsObject): TemporalPlainDateTime {.importjs: "Temporal.PlainDateTime.from(#, #)".}
func newTemporalPlainDateTime*(thing: auto): TemporalPlainDateTime {.importjs: "Temporal.PlainDateTime.from(#)".}
func compare*(a, b: TemporalPlainDateTime): cint {.importjs: "Temporal.TemporalPlainDateTime.compare(#, #)".}
func with*(self: TemporalPlainDateTime; dateTimeLike: cstring or JsObject; options: JsObject): TemporalPlainDateTime {.importjs: "#.$1(#, #)".}
func with*(self: TemporalPlainDateTime; dateTimeLike: cstring or JsObject): TemporalPlainDateTime {.importjs: "#.$1(#)".}
func withCalendar*(self: TemporalPlainDateTime; calendar: cstring or JsObject): TemporalPlainDateTime {.importjs: "#.$1(#)".}
func add*(self: TemporalPlainDateTime; duration, options: cstring or JsObject or TemporalDuration): TemporalPlainDateTime {.importjs: "#.$1(#, #)".}
func add*(self: TemporalPlainDateTime; duration: cstring or JsObject or TemporalDuration): TemporalPlainDateTime {.importjs: "#.$1(#)".}
func subtract*(self: TemporalPlainDateTime; duration: cstring or JsObject or TemporalDuration): TemporalPlainDateTime {.importjs: "#.$1(#)".}
func round*(self: TemporalPlainDateTime; options: JsObject): TemporalPlainDateTime {.importjs: "#.$1(#)".}
func `==`*(a, b: TemporalPlainDateTime): bool {.importjs: "#.equals(#)".}
func newTemporalDuration*(years, months, weeks, days, hours, minutes, seconds, milliseconds, microseconds, nanoseconds: cint = 0): TemporalDuration {.importjs: "(new Temporal.Duration((#, #, #, #, #, #, #, #, #, #))".}
func newTemporalDuration*(thing: auto): TemporalDuration {.importjs: "Temporal.Duration.from(#)".}
func compare*(a, b: TemporalDuration): cint {.importjs: "Temporal.Duration.compare(#, #)".}
func with*(self: TemporalDuration; durationLike: JsObject): TemporalDuration {.importjs: "#.$1(#)".}
func subtract*(self: TemporalDuration; duration, options: cstring or JsObject or TemporalDuration): TemporalDuration {.importjs: "#.$1(#, #)".}
func subtract*(self: TemporalDuration; duration: cstring or JsObject or TemporalDuration): TemporalDuration {.importjs: "#.$1(#)".}
func negated*(self: TemporalDuration): TemporalDuration {.importjs: "#.$1()".}
func abs*(self: TemporalDuration): TemporalDuration {.importjs: "#.$1()".}
func round*(self: TemporalDuration; options: JsObject): TemporalDuration {.importjs: "#.$1(#)".}
func total*(self: TemporalDuration; options: JsObject): cint {.importjs: "#.$1(#)".}
func newTemporalTimeZone*(timeZoneIdentifier: cstring): TemporalTimeZone {.importjs: "(new Temporal.TimeZone(#))".}
func newTemporalTimeZone*(thing: auto): TemporalTimeZone {.importjs: "Temporal.TimeZone.from(#)".}
func getOffsetNanosecondsFor*(self: TemporalTimeZone; instant: TemporalInstant or cstring): cint {.importjs: "#.$1(#)".}
func getOffsetStringFor*(self: TemporalTimeZone; instant: TemporalInstant or cstring): cstring {.importjs: "#.$1(#)".}
func getPlainDateTimeFor*(self: TemporalTimeZone; instant: TemporalInstant or cstring; calendar: JsObject or cstring): TemporalPlainDateTime {.importjs: "#.$1(#, #)".}
func getPlainDateTimeFor*(self: TemporalTimeZone; instant: TemporalInstant or cstring): TemporalPlainDateTime {.importjs: "#.$1(#)".}
func getInstantFor*(self: TemporalTimeZone; dateTime: TemporalPlainDateTime or cstring or JsObject; options: JsObject): TemporalInstant {.importjs: "#.$1(#, #)".}
func getInstantFor*(self: TemporalTimeZone; dateTime: TemporalPlainDateTime or cstring or JsObject): TemporalInstant {.importjs: "#.$1(#)".}
func getPossibleInstantsFor*(self: TemporalTimeZone; dateTime: TemporalPlainDateTime or cstring or JsObject): seq[TemporalInstant] {.importjs: "#.$1(#)".}
func getNextTransition*(self: TemporalTimeZone; startingPoint: TemporalInstant or cstring): TemporalInstant {.importjs: "#.$1(#)".}
func getPreviousTransition*(self: TemporalTimeZone; startingPoint: TemporalInstant or cstring): TemporalInstant {.importjs: "#.$1(#)".}
func newTemporalCalendar*(calendarIdentifier: cstring): TemporalCalendar {.importjs: "(new Temporal.Calendar(#))".}
func newTemporalCalendar*(thing: auto): TemporalCalendar {.importjs: "Temporal.Calendar.from(#)".}
func era*(self: TemporalCalendar; date: TemporalPlainDate or TemporalPlainDateTime or TemporalZonedDateTime or cstring): cstring {.importjs: "#.$1(#)".}
func eraYear*(self: TemporalCalendar; date: TemporalPlainDate or TemporalPlainDateTime or TemporalZonedDateTime or cstring): cint {.importjs: "#.$1(#)".}
func year*(self: TemporalCalendar; date: TemporalPlainDate or TemporalPlainDateTime or TemporalZonedDateTime or cstring): cint {.importjs: "#.$1(#)".}
func month*(self: TemporalCalendar; date: TemporalPlainDate or TemporalPlainDateTime or TemporalZonedDateTime or cstring): cint {.importjs: "#.$1(#)".}
func monthCode*(self: TemporalCalendar; date: TemporalPlainDate or TemporalPlainDateTime or TemporalZonedDateTime or cstring): cstring {.importjs: "#.$1(#)".}
func day*(self: TemporalCalendar; date: TemporalPlainDate or TemporalPlainDateTime or TemporalZonedDateTime or cstring): cint {.importjs: "#.$1(#)".}
func dayOfWeek*(self: TemporalCalendar; date: TemporalPlainDate or TemporalPlainDateTime or TemporalZonedDateTime or cstring): cint {.importjs: "#.$1(#)".}
func dayOfYear*(self: TemporalCalendar; date: TemporalPlainDate or TemporalPlainDateTime or TemporalZonedDateTime or cstring): cint {.importjs: "#.$1(#)".}
func weekOfYear*(self: TemporalCalendar; date: TemporalPlainDate or TemporalPlainDateTime or TemporalZonedDateTime or cstring): cint {.importjs: "#.$1(#)".}
func daysInWeek*(self: TemporalCalendar; date: TemporalPlainDate or TemporalPlainDateTime or TemporalZonedDateTime or cstring): cint {.importjs: "#.$1(#)".}
func daysInMonth*(self: TemporalCalendar; date: TemporalPlainDate or TemporalPlainDateTime or TemporalZonedDateTime or cstring): cint {.importjs: "#.$1(#)".}
func daysInYear*(self: TemporalCalendar; date: TemporalPlainDate or TemporalPlainDateTime or TemporalZonedDateTime or cstring): cint {.importjs: "#.$1(#)".}
func monthsInYear*(self: TemporalCalendar; date: TemporalPlainDate or TemporalPlainDateTime or TemporalZonedDateTime or cstring): cint {.importjs: "#.$1(#)".}
func inLeapYear*(self: TemporalCalendar; date: TemporalPlainDate or TemporalPlainDateTime or TemporalZonedDateTime or cstring): bool {.importjs: "#.$1(#)".}
