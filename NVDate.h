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
    NVMonthUnitDesember  = 12,
};

@interface NVDate : NSObject

- (id)initUsingToday;
- (id)initUsingDate:(NSDate *)date;
- (id)initUsingSeconds:(NSInteger)seconds;

- (NSDate *)date;

- (NSString *)stringValue;
- (NSString *)stringValueWithFormat:(NSString *)dateFormat;

- (void)zeroTime;

- (instancetype)previousDay;
- (instancetype)previousDays:(NSInteger)days;
- (instancetype)nextDay;
- (instancetype)nextDays:(NSInteger)days;

- (instancetype)previousWeek;
- (instancetype)previousWeeks:(NSInteger)weeks;
- (instancetype)nextWeek;
- (instancetype)nextWeeks:(NSInteger)weeks;

- (instancetype)previousMonth;
- (instancetype)previousMonths:(NSInteger)months;
- (instancetype)nextMonth;
- (instancetype)nextMonths:(NSInteger)months;

- (instancetype)previousYear;
- (instancetype)previousYears:(NSInteger)years;
- (instancetype)nextYear;
- (instancetype)nextYears:(NSInteger)years;

- (instancetype)firstDayOfMonth;
- (instancetype)lastDayOfMonth;

- (instancetype)previousDayOfDayName:(NVDayUnit)dayUnit;
- (instancetype)nextDayOfDayName:(NVDayUnit)dayUnit;

- (BOOL)isTodayName:(NVDayUnit)dayUnit;

@property NSString *dateFormatUsingString;
@property NSDateFormatterStyle dateFormatUsingStyle;
@property NSDateFormatterStyle timeFormatUsingStyle;

@end
