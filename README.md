# Introduction

__NVDate__ is a Swift date utility library for Swift projects, created to make date and time manipulation easier. __NVDate__ is testable and robust, we wrote extensive tests to make sure everything is safe.

[![Release](https://img.shields.io/github/v/release/novalagung/nvdate)](https://github.com/novalagung/nvdate/releases)
[![Build](https://img.shields.io/github/actions/workflow/status/novalagung/nvdate/test.yml?branch=master&label=build)](https://github.com/novalagung/nvdate/actions/workflows/test.yml)
[![Coverage](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/novalagung/nvdate/master/coverage.json)](https://github.com/novalagung/nvdate/actions/workflows/test.yml)

## Features

* A lot of API functions to make date and time manipulation easier and fun
* Self-explanatory & intuitive naming convention
* NVDate functions are _chainable_
* Easy to use
* Open Source!

## Installation

#### ◉ Using Swift Package Manager

Add this package URL in Xcode or your `Package.swift`:

```swift
.package(url: "https://github.com/novalagung/NVDate.git", from: "3.0.0")
```

Then add `NVDate` as a dependency of your target and import it:

```swift
import NVDate
```

#### ◉ Using CocoaPods

Swift Package Manager is the recommended installation path for NVDate 3.0.0 and newer. CocoaPods support is kept for existing projects.

Add these into your `Podfile`:

```ruby
pod 'NVDate', :git => 'https://github.com/novalagung/NVDate.git', :tag => '3.0.0'
```

Then import `NVDate` into your Swift file.

```swift
import NVDate
```

##### Legacy Objective-C

Add these into your `Podfile`:

```ruby
pod 'NVDate', '1.0.0'
```

Then import `NVdate.h` into your .h or .m file.

```objectivec
#import "NVDate.h"
```

## Example

##### ◉ Today date as string

```swift
let date = NVDate()

print(date.asString())
// ==> Wednesday, February 5, 2014, 4:56:35 PM Western Indonesia Time
```

##### ◉ Date 2018/05/25 as string

```swift
let date = NVDate(fromString: "2018/05/25", withFormat: "yyyy/MM/dd")

print(date.asString())
// ==> Friday, May 25, 2018, 00:00:00 AM Western Indonesia Time
```

##### ◉ Last day of next 2 months

```swift
let date = NVDate()
    .nextMonths(diff: 2)
    .lastDayOfMonth()

print(date.asString(withFormat: "dd-MM-yyyy"))
// ==> 30-04-2014
```

##### ◉ Second week of 2 months ago

```swift
let date = NVDate()
    .previousMonths(diff: 2)
    .firstDayOfMonth()
    .nextWeek()
date.dateFormat(setFormat: "yyyy-MM-dd HH:mm:ss")

print(date.asString())
// ==> 2013-12-08 17:03:36
```

##### ◉ Detect if 2018/05/25 is friday

```swift
let todayIsFriday = NVDate(year: 2018, month: 5, day: 25)
    .previousDay()
    .isTodayName(.friday)

print(todayIsFriday)
// ==> false
```

##### ◉ Dot syntax

```swift
let someday = NVDate()
    .previousDay()
    .previousWeek()
    .nextDay()
    .asString()

print(someday)
// ==> 2013-12-08 17:03:36
```

## API Documentation

#### ◉ Types

Type | Values
--- | ---
`NVDate.DayName` | `.sunday`, `.monday`, `.tuesday`, `.wednesday`, `.thursday`, `.friday`, `.saturday`
`NVDate.MonthName` | `.january`, `.february`, `.march`, `.april`, `.may`, `.june`, `.july`, `.august`, `.september`, `.october`, `.november`, `.december`

#### ◉ Initializers

Initializer | Description
--- | ---
`NVDate()` | Constructs an instance using the current date and time.
`NVDate(fromString: String, withFormat: String)` | Constructs an instance by parsing a string with an explicit date format.
`NVDate(year: Int, month: Int, day: Int)` | Constructs an instance from year, month, and day components.
`NVDate(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int)` | Constructs an instance from full date and time components.
`NVDate(fromDate: Date)` | Constructs an instance from an existing `Date`.
`NVDate(fromTimeIntervalSinceReferenceDate: TimeInterval)` | Constructs an instance from a Foundation reference-date time interval.

#### ◉ Formatting and Configuration

Method | Return | Description
--- | --- | ---
`date()` | `Date?` | Returns the underlying date value.
`asString()` | `String` | Formats the date using the configured formatter.
`asString(withFormat: String)` | `String` | Formats the date using the provided date format.
`dateFormat()` | `String` | Returns the formatter's current date format.
`dateFormat(setFormat: String)` | `Void` | Sets the formatter's date format.
`dateStyle()` | `DateFormatter.Style` | Returns the formatter's date style.
`dateStyle(setStyle: DateFormatter.Style)` | `Void` | Sets the formatter's date style.
`timeStyle()` | `DateFormatter.Style` | Returns the formatter's time style.
`timeStyle(setStyle: DateFormatter.Style)` | `Void` | Sets the formatter's time style.
`timeZone()` | `TimeZone` | Returns the configured time zone.
`timeZone(setTimeZone: TimeZone)` | `Void` | Sets the time zone used by the formatter and calendar.

#### ◉ Date Arithmetic

Method | Return | Description
--- | --- | ---
`setTimeAsZero()` | `NVDate` | Sets hour, minute, and second to `0`.
`nextDays(days: Int)` | `NVDate` | Moves the date forward by the provided number of days.
`nextDay()` | `NVDate` | Moves the date forward by one day.
`tomorrow()` | `NVDate` | Alias of `nextDay()`.
`previousDays(diff: Int)` | `NVDate` | Moves the date backward by the provided number of days.
`previousDay()` | `NVDate` | Moves the date backward by one day.
`yesterday()` | `NVDate` | Alias of `previousDay()`.
`nextWeeks(diff: Int)` | `NVDate` | Moves the date forward by the provided number of weeks.
`nextWeek()` | `NVDate` | Moves the date forward by one week.
`previousWeeks(diff: Int)` | `NVDate` | Moves the date backward by the provided number of weeks.
`previousWeek()` | `NVDate` | Moves the date backward by one week.
`nextMonths(diff: Int)` | `NVDate` | Moves the date forward by the provided number of months.
`nextMonth()` | `NVDate` | Moves the date forward by one month.
`previousMonths(diff: Int)` | `NVDate` | Moves the date backward by the provided number of months.
`previousMonth()` | `NVDate` | Moves the date backward by one month.
`nextYears(diff: Int)` | `NVDate` | Moves the date forward by the provided number of years.
`nextYear()` | `NVDate` | Moves the date forward by one year.
`previousYears(diff: Int)` | `NVDate` | Moves the date backward by the provided number of years.
`previousYear()` | `NVDate` | Moves the date backward by one year.
`firstDayOfMonth()` | `NVDate` | Moves the date to the first day of its current month.
`lastDayOfMonth()` | `NVDate` | Moves the date to the last day of its current month.
`firstMonthOfYear()` | `NVDate` | Moves the date to January of its current year.
`lastMonthOfYear()` | `NVDate` | Moves the date to December of its current year.
`nearestPreviousDay(_ dayName: NVDate.DayName)` | `NVDate` | Moves the date to the nearest previous matching weekday.
`nearestNextDay(_ dayName: NVDate.DayName)` | `NVDate` | Moves the date to the nearest next matching weekday.

#### ◉ Date Information

Method | Return | Description
--- | --- | ---
`thisDayName()` | `NVDate.DayName` | Returns the weekday name for the current date value.
`todayName()` | `NVDate.DayName` | Alias of `thisDayName()`.
`isThisDayName(_ dayName: NVDate.DayName)` | `Bool` | Returns whether the date's weekday matches the provided weekday.
`isTodayName(_ dayName: NVDate.DayName)` | `Bool` | Alias of `isThisDayName(_:)`.
`thisMonthName()` | `NVDate.MonthName` | Returns the month name for the current date value.
`isThisMonthName(_ monthName: NVDate.MonthName)` | `Bool` | Returns whether the date's month matches the provided month.
`year()` | `Int` | Returns the year component.
`year(setYear: Int)` | `Void` | Sets the year component.
`month()` | `Int` | Returns the month component.
`month(setMonth: Int)` | `Void` | Sets the month component.
`weekOfYear()` | `Int` | Returns the week-of-year component.
`weekOfMonth()` | `Int` | Returns the week-of-month component.
`day()` | `Int` | Returns the day component.
`day(setDay: Int)` | `Void` | Sets the day component.
`hour()` | `Int` | Returns the hour component.
`hour(setHour: Int)` | `Void` | Sets the hour component.
`minute()` | `Int` | Returns the minute component.
`minute(setMinute: Int)` | `Void` | Sets the minute component.
`second()` | `Int` | Returns the second component.
`second(setSecond: Int)` | `Void` | Sets the second component.

## Contribution

Feel free to contribute by doing `fork` -> `pull request`

## License

http://novalagung.mit-license.org/
