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

#### Manually

[Download](https://github.com/novalagung/NVDate/archive/master.zip) the source, copy both `NVDate.h` and `NVDate.m` files to your project, then import it.

```objective-c
#import "NVDate.h"
```

#### CocoaPods

Installing NVDate using [CocoaPods](http://cocoapods.org/) is easier. Simply add the following line to your `Podfile` :

```ruby
pod 'NVDate'
```


Simple Example
======
    
#### Full date of today

```objective-c
NVDate *date = [[NVDate alloc] initUsingToday];
NSLog(@"today is : %@", [date stringValue]);

// today is : Wednesday, February 5, 2014, 4:56:35 PM Western Indonesia Time
```

#### Last day of next 2 months

```objective-c
NVDate *date = [[NVDate alloc] initUsingToday];
[date nextMonths:2];
[date lastDayOfMonth];
NSLog(@"next 2 months from today is : %@", [date stringValueWithFormat:@"dd-MM-yyyy"]);

// next 2 months from today is : 30-04-2014
```

#### Second week of 2 months ago
    
```objective-c
NVDate *date = [[[[[NVDate alloc] initUsingToday] previousMonths:2] firstDayOfMonth] nextWeek];
date.dateFormatUsingString = @"yyyy-MM-dd HH:mm:ss";
NSLog(@"second week of 2 months ago is : %@", [date stringValue]);

// second week of 2 months ago is : 2013-12-08 17:03:36
```

#### Detect if yesterday is friday

```objective-c
BOOL isFriday = [[[[NVDate alloc] initUsingToday] previousDay] isCurrentDayName:NVDayUnitFriday];
NSLog(@"is yesterday was friday ? %@", isFriday ? @"yes" : @"no");

// is yesterday was friday ? no
```

#### Dot syntax

```objective-c
NVDate *nvDate = [[NVDate alloc] initUsingToday];
NSString someday = nvDate.previousDay.previousWeek.nextDay.stringValue;
NSLog(@"someday %@", someday);
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
