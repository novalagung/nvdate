Introduction
======

[![Build Status](https://travis-ci.org/novalagung/nvdate.svg?branch=master)](https://travis-ci.org/novalagung/nvdate)
![CocoaPods](https://img.shields.io/cocoapods/v/NVDate.svg)
![CocoaPods](https://img.shields.io/cocoapods/dt/NVDate.svg)


__NVDate__ is an extension of `NSDate` class (Swift4), created to make date and time manipulation easier. NVDate is testable and robust, we wrote intensive test to make sure we are safe to use.

Features
======

* Has lot of API function to make date and time manipulation easier and fun
* Has user friendly naming convention
* NVDate functions are _chainable_
* Very easy to use
* Open Source!

Installation
======

### Using Cocoa Pods

##### Swift4

Add these into your `Podfile`:

```ruby
pod 'NVDate', '2.0.1'
```

Then import `NVdate` into your swift file.

```swift
import NVDate
```

##### Objective-C

Add these into your `Podfile`:

```ruby
pod 'NVDate', '1.0.0'
```

Then import `NVdate.h` into your .h or .m file.

```objectivec
#import "NVDate.h"
```

Simple Example
======

### Today date as string

```swift
let date = NVDate()

print(date.asString())
// ==> Wednesday, February 5, 2014, 4:56:35 PM Western Indonesia Time
```

### Date 2018/05/25 as string

```swift
let date = NVDate(fromString: "2018/05/25", withFormat: "yyyy/MM/dd")

print(date.asString())
// ==> Friday, May 25, 2018, 00:00:00 AM Western Indonesia Time
```

### Last day of next 2 months

```swift
let date = NVDate()
    .nextMonths(diff: 2)
    .lastDayOfMonth()

print(date.asString(withFormat: "dd-MM-yyyy"))
// ==> 30-04-2014
```

### Second week of 2 months ago

```swift
let date = NVDate()
    .previousMonths(diff: 2)
    .firstDayOfMonth()
    .nextWeek()
date.dateFormat(setFormat: "yyyy-MM-dd HH:mm:ss")

print(date.asString())
// ==> 2013-12-08 17:03:36
```

### Detect if 2018/05/25 is friday

```swift
let todayIsFriday = NVDate(year: 2018, month: 5, day: 25)
    .previousDay()
    .isTodayName(.friday)

print(todayIsFriday)
// ==> false
```

### Dot syntax

```swift
let someday = NVDate()
    .previousDay()
    .previousWeek()
    .nextDay()
    .asString()

print(someday)
// ==> 2013-12-08 17:03:36
```

API Documentation
======

#### Initialization

Initialization | Description
--- | ---
`NVDate()` | Today date is used as date value
`NVDate(fromString:withFormat:)` | Use specified date string as date value. Format of specified date string has to be explicitly defined.
`NVDate(year:month:day:)` | Construct new date using year, month, and day
`NVDate(year:month:day:hour:minute:second:)` | Construct new date using year, month, day, hour, minute, second
`NVDate(fromDate: Date)` | use specified date as value

#### Methods

Method | Description
--- | ---
`date()` | return the date object
`asString()` | return string formatted of date object
`asString(withFormat:)` | return formatted string value of date object. the format has to be defined explicitly
`setTimeAsZero()` | set hour, minute, and second as 0
`dateFormat()` | return the current date format. the format is used on `asString()`
`dateFormat(setFormat:)` | change current date format. the format is used on `asString()`
`dateStyle()` | return the date style of current formatter
`dateStyle(setStyle:)` | change date style of current formatter
`timeStyle()` | return the time style of current formatter
`timeStyle(setStyle:)` | change time style of current formatter
`timeZone()` | return current timezone value
`timeZone(setTimeZone:)` | change the timezone value
`nextDays(days:)` | move to next __x__ days
`nextDay()` | move to next day
`tomorrow()` | alias of `nextDay()`
`previousDays(days:)` | move to previous __x__ days
`previousDay()` | move to previous day
`yesterday()` | alias of `previousDay()`
`nextWeek()` | move to next week
`nextWeeks(diff:)` | move to next __x__ weeks
`previousWeek()` | move to previous week
`previousWeeks(diff:)` | move to previous __x__ weeks
`nextMonth()` | move to next month
`nextMonths(diff:)` | move to next __x__ months
`previousMonth()` | move to previous month
`previousMonths(diff:)` | move to previous __x__ months
`nextYear()` | move to next year
`nextYears(diff:)` | move to next __x__ years
`previousYear()` | move to previous year
`previousYears(diff:)` | move to previous __x__ years
`firstDayOfMonth()` | move to first day of current month
`lastDayOfMonth()` | move to last day of current month
`firstMonthOfYear()` | move to first month of current year
`lastMonthOfYear()` | move to last month of current year
`nearestPreviousDay(_:)` | move to __x__ previous day that name equal to `NVDate.DayName`
`nearestNextDay(_:)` | move to __x__ next day that name equal to `NVDate.DayName`
`thisDayName()` | get today day name, in type `NVDate.DayName`
`todayName()` | alias of `thisDayName()`
`isThisDayName(_:)` | return true if specified day name is equal with day on the object
`isTodayName(_:)` | alias of `isThisDayName(_:)`
`thisMonthName()` | get this month name, in type `NVDate.MonthName`
`isThisMonthName(_:)` | return true if specified month name is equal with month on the object
`year()` | return year value
`year(setYear:)` | change year value
`month()` | return month value
`month(setMonth:)` | change month value
`weekOfYear()` | return week of year value
`weekOfMonth()` | return week of month value
`day()` | return day value
`day(setDay:)` | change day value
`hour()` | return hour value
`hour(setHour:)` | change hour value
`minute()` | return minute value
`minute(setMinute:)` | change minute value
`second()` | return second value
`second(setSecond:)` | change second value


Contribution
======

Feel free to contribute by doing `fork` -> `pull request`


License
======

http://novalagung.mit-license.org/
