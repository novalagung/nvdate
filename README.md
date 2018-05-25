Introduction
======

[![Build Status](https://travis-ci.org/novalagung/nvdate.svg?branch=master)](https://travis-ci.org/novalagung/nvdate)
![CocoaPods](https://img.shields.io/cocoapods/v/NVDate.svg)
![CocoaPods](https://img.shields.io/cocoapods/dt/NVDate.svg)


__NVDate__ is an extension of `NSDate` class (Swift4), created to make date and time manipulation easier.

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

Documentation
======

[https://github.com/novalagung/NVDate/wiki/API-Reference](https://github.com/novalagung/NVDate/wiki/API-Reference)


Contribution
======

Feel free to add contribution to this project by `fork` -> `pull request`


License
======

http://novalagung.mit-license.org/
