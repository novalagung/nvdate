Introduction
======
__NVDate__ is library for handling `NSDate` manipulation in iOS Development.


Features
======
__NVDate__ have many features that helps to solve your problem.

* Capable to do lot of date manipulation task
* User friendly naming convention
* _Chainable_ functions
* Easy to use
* Open Source !


Simple Example
======
You need to copy both `NVDate.h` and `NVDate.m` files to your project. 
And then, import the file `#import "NVDate.h"`.
    
#### Full date of today

```objectivec
NVDate *date = [[NVDate alloc] initUsingToday];
NSLog(@"today is : %@", [date stringValue]);

// today is : Wednesday, February 5, 2014, 4:56:35 PM Western Indonesia Time
```

#### Last day's date of next 2 months

```objectivec
NVDate *date = [[NVDate alloc] initUsingToday];
[date nextMonths:2];
[date lastDayOfMonth];
NSLog(@"next 2 months from today is : %@", [date stringValueWithFormat:@"dd-MM-yyyy"]);

// next 2 months from today is : 30-04-2014
```

#### Next 8 days from last 2 months
    
```objectivec
NVDate *date = date = [[[[[NVDate alloc] initUsingToday] previousMonths:2] firstDayOfMonth] nextWeek];
date.dateFormatUsingString = @"yyyy-MM-dd HH:mm:ss";
NSLog(@"second week of 2 months ago is : %@", [date stringValue]);

// second week of 2 months ago is : 2013-12-08 17:03:36
```

#### Detect if yesterday is friday

```objectivec
BOOL isFriday = [[[[NVDate alloc] initUsingToday] previousDay] isCurrentDayName:NVDayUnitFriday];
NSLog(@"is yesterday was friday ? %@", isFriday ? @"yes" : @"no");

// is yesterday was friday ? no
```

Documentation
======

Currently documentaion page isn't ready


Contribution
======

Feel free to add contribution to this project by `fork` -> `pull request`


License
======

http://novalagung.mit-license.org/
