//
//  NVDate.h
//  NDate
//
//  Created by Noval Agung Prayogo on 2/5/14.
//  Copyright (c) 2014 Noval Agung Prayogo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVDate : NSObject

- (id)initUsingToday;
- (id)initUsingDate:(NSDate *)date;
- (id)initUsingSeconds:(NSInteger)seconds;

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

@property NSString *dateFormatUsingString;
@property NSDateFormatterStyle dateFormatUsingStyle;
@property NSDateFormatterStyle timeFormatUsingStyle;

@end
