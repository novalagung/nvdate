//
//  NVDate.h
//
//  Created by Noval Agung Prayogo on 2/5/14.
//  Copyright (c) 2014 Noval Agung Prayogo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, NVDayUnit) {
    NVDayUnitSunday    = 1,
    NVDayUnitMonday    = 2,
    NVDayUnitTuesday   = 3,
    NVDayUnitWednesday = 4,
    NVDayUnitThursday  = 5,
    NVDayUnitFriday    = 6,
    NVDayUnitSaturday  = 7
};

typedef NS_OPTIONS(NSUInteger, NVMonthUnit) {
    NVMonthUnitJanuary   = 1,
    NVMonthUnitFebruary  = 2,
    NVMonthUnitMarch     = 3,
    NVMonthUnitApril     = 4,
    NVMonthUnitMay       = 5,
    NVMonthUnitJune      = 6,
    NVMonthUnitJuly      = 7,
    NVMonthUnitAugust    = 8,
    NVMonthUnitSeptember = 9,
    NVMonthUnitOctober   = 10,
    NVMonthUnitNovember  = 11,
    NVMonthUnitDecember  = 12,
};

@interface NVDate : NSObject

- (id)initUsingToday;
- (id)initUsingDate:(NSDate *)date;
- (id)initUsingYear:(int)year month:(int)month day:(int)day;
- (id)initUsingYear:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute second:(int)second;
- (id)initUsingString:(NSString *)stringDate;
- (id)initUsingString:(NSString *)stringDate withFormat:(NSString *)dateFormat;
- (id)initUsingSeconds:(int)seconds;

- (NSDate *)date;

- (NSString *)stringValue;
- (NSString *)stringValueWithFormat:(NSString *)dateFormat;

- (instancetype)zeroTime;

- (instancetype)previousDay;
- (instancetype)previousDays:(int)days;
- (instancetype)nextDay;
- (instancetype)nextDays:(int)days;

- (instancetype)previousWeek;
- (instancetype)previousWeeks:(int)weeks;
- (instancetype)nextWeek;
- (instancetype)nextWeeks:(int)weeks;

- (instancetype)previousMonth;
- (instancetype)previousMonths:(int)months;
- (instancetype)nextMonth;
- (instancetype)nextMonths:(int)months;

- (instancetype)previousYear;
- (instancetype)previousYears:(int)years;
- (instancetype)nextYear;
- (instancetype)nextYears:(int)years;

- (instancetype)firstDayOfMonth;
- (instancetype)lastDayOfMonth;

- (instancetype)firstMonthOfYear;
- (instancetype)lastMonthOfYear;

- (instancetype)previousDayOfDayName:(NVDayUnit)dayUnit;
- (instancetype)nextDayOfDayName:(NVDayUnit)dayUnit;

- (BOOL)isCurrentDayName:(NVDayUnit)dayUnit;
- (BOOL)isCurrentMonthName:(NVMonthUnit)monthUnit;

@property NSString *dateFormatUsingString;
@property NSDateFormatterStyle dateFormatUsingStyle;
@property NSDateFormatterStyle timeFormatUsingStyle;
@property int year;
@property int month;
@property (readonly) int week;
@property int day;
@property int hour;
@property int minute;
@property int second;

@end
