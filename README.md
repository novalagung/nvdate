Introduction
======

[![Build Status](https://travis-ci.org/novalagung/NVDate.png?branch=master)](https://travis-ci.org/novalagung/NVDate)
[![Version](http://img.shields.io/cocoapods/v/NVDate.svg)](http://cocoadocs.org/docsets/NVDate)

__NVDate__ is library for handling `NSDate` manipulation in iOS Development.


Features
======
__NVDate__ have many features that help to solve your problem.

* Capable to do lot of date manipulation task
* User friendly naming convention
* _Chainable_ functions
* Easy to use
* Open Source !


Installation
======

### Manually

[Download](https://github.com/novalagung/NVDate/archive/master.zip) the source, then follow these steps:

 * Objective-C
 
   Copy both `NVDate.h` and `NVDate.m` files into your project
   
    ```objectivec
    #import "NVDate.h"
    ```

 * Swift
 
   Copy `NVDate.Swift`

### CocoaPods

Installing NVDate using [CocoaPods](http://cocoapods.org/) is easier. Simply add the following line to your `Podfile` :

```ruby
pod 'NVDate'
```


Simple Example
======
    
### Full date of today

##### Objective-C

```objectivec
NVDate *date = [[NVDate alloc] initUsingToday];
 
NSLog(@"today is : %@", [date stringValue]);
// today is : Wednesday, February 5, 2014, 4:56:35 PM Western Indonesia Time
```

##### Swift

```swift
let date = NVDate(isUsingToday: true)

NSLog("today is : %@", date.stringValue());
// today is : Wednesday, February 5, 2014, 4:56:35 PM Western Indonesia Time
```

### Last day of next 2 months

##### Objective-C

```objectivec
NVDate *date = [[NVDate alloc] initUsingToday];
[date nextMonths:2];
[date lastDayOfMonth];

NSLog(@"next 2 months from today is : %@", [date stringValueWithFormat:@"dd-MM-yyyy"]);
// next 2 months from today is : 30-04-2014
```

##### Swift

```swift
var date = NVDate(isUsingToday: true)
date.nextMonths(2);
date.lastDayOfMonth(2);

NSLog("next 2 months from today is : %@", date.stringValue(dateFormat: "dd-MM-yyyy"));
// next 2 months from today is : 30-04-2014
```

### Second week of 2 months ago

##### Objective-C

```objectivec
NVDate *date = [[[[[NVDate alloc] initUsingToday] previousMonths:2] firstDayOfMonth] nextWeek];
date.dateFormatUsingString = @"yyyy-MM-dd HH:mm:ss";

NSLog(@"second week of 2 months ago is : %@", [date stringValue]);
// second week of 2 months ago is : 2013-12-08 17:03:36
```

##### Swift

```swift
var date = NVDate(isUsingToday: true).previousMonths(2).firstDayOfMonth().nextWeek()
date.dateFormatUsingString = "yyyy-MM-dd HH:mm:ss";

NSLog("second week of 2 months ago is : %@", date.stringValue());
// second week of 2 months ago is : 2013-12-08 17:03:36
```

### Detect if yesterday is friday

##### Objective-C

```objectivec
BOOL isFriday = [[[[NVDate alloc] initUsingToday] previousDay] isCurrentDayName:NVDayUnitFriday];

NSLog(@"is yesterday was friday ? %@", isFriday ? @"yes" : @"no");
// is yesterday was friday ? no
```

##### Swift

```swift
Bool isFriday = NVDate(isUsingToday: true).previousDay().isCurrentDayName(.Friday)

NSLog("is yesterday was friday ? %@", isFriday ? "yes" : "no");
// is yesterday was friday ? no
```

### Dot syntax

##### Objective-C

```objectivec
NVDate *nvDate = [[NVDate alloc] initUsingToday];
NSString someday = nvDate.previousDay.previousWeek.nextDay.stringValue;

NSLog(@"someday %@", someday);
// someday 2013-12-08 17:03:36
```

##### Swift

```swift
var nvDate = NVDate(isUsingToday: true);
String someday = nvDate.previousDay().previousWeek().nextDay().stringValue();

NSLog(@"someday %@", someday);
// someday 2013-12-08 17:03:36
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
