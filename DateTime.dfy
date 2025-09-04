module Std.DateTime.DateTime {
  // Core constants
  const DAYS_IN_MONTH: seq<int>
  const UNIX_EPOCH_YEAR: int
  const MILLISECONDS_PER_SECOND: int
  const SECONDS_PER_MINUTE: int
  const MINUTES_PER_HOUR: int
  const HOURS_PER_DAY: int
  const DAYS_PER_WEEK: int

  function {:axiom} DaysInMonth(year: int, month: int): int
    requires 1 <= month <= 12
    ensures 28 <= DaysInMonth(year, month) <= 31

  function {:axiom} GetDayOfWeek(dt: DateTime): int
    requires IsValid(dt)
    ensures 0 <= GetDayOfWeek(dt) <= 6

  function {:axiom} GetDayOfYear(dt: DateTime): int
    requires IsValid(dt)
    ensures 1 <= GetDayOfYear(dt) <= 366

  predicate IsLeapYear(year: int)

  function {:axiom} DaysInYear(year: int): int
    ensures DaysInYear(year) == 365 || DaysInYear(year) == 366

  // Primary DateTime datatype
  datatype DateTime = DateTime(
    year: int,
    month: int,        // 1-12
    day: int,          // 1-31
    hour: int,         // 0-23
    minute: int,       // 0-59
    second: int,       // 0-59
    millisecond: int  // 0-999
    // timezone: Timezone.Timezone
    // set timezone to PST for simplicity in this demo
  )

  predicate IsValid(dt: DateTime) {
    1 <= dt.month <= 12 &&
    1 <= dt.day <= DaysInMonth(dt.year, dt.month) &&
    0 <= dt.hour < HOURS_PER_DAY &&
    0 <= dt.minute < MINUTES_PER_HOUR &&
    0 <= dt.second < SECONDS_PER_MINUTE &&
    0 <= dt.millisecond < MILLISECONDS_PER_SECOND
    // Timezone.IsValidTimezone(dt.timezone)
  }
}