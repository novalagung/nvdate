//
//  NVDate.m
//
//  Created by Noval Agung Prayogo on 2/5/14.
//  Copyright (c) 2014 Noval Agung Prayogo. All rights reserved.
//

#import "NVDate.h"

@implementation NVDate {
    NSDateFormatter *_dateFormatter;
    NSCalendar *_calendar;
    NSDate *_date;
    NSCalendarUnit _dateTimeCalendarUnit;
}

- (id)init {
    if (self = [super init]) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        _dateFormatter.dateStyle = NSDateFormatterFullStyle;
        _dateFormatter.timeStyle = NSDateFormatterFullStyle;
        
        _calendar = [NSCalendar currentCalendar];
        
        _date = [[NSDate alloc] init];
        
        _dateTimeCalendarUnit = (NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit);
    }
    return self;
}

- (id)initUsingToday {
    if (self = [self init]) {
        _date = [NSDate date];
    }
    return self;
}

- (id)initUsingString:(NSString *)stringDate {
    if (self = [self init]) {
        _date = [_dateFormatter dateFromString:stringDate];
    }
    return self;
}

- (id)initUsingString:(NSString *)stringDate withFormat:(NSString *)dateFormat {
    if (self = [self init]) {
        _dateFormatter.dateFormat = dateFormat;
        _date = [_dateFormatter dateFromString:stringDate];
    }
    return self;
}

- (id)initUsingYear:(int)year month:(int)month day:(int)day {
    if (self = [self init]) {
        NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
        dateComponents.year = year;
        dateComponents.month = month;
        dateComponents.day = day;
        _date = [_calendar dateFromComponents:dateComponents];
    }
    return self;
}

- (id)initUsingYear:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute second:(int)second {
    if (self = [self init]) {
        NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
        dateComponents.year = year;
        dateComponents.month = month;
        dateComponents.day = day;
        dateComponents.hour = hour;
        dateComponents.minute = minute;
        dateComponents.second = second;
        _date = [_calendar dateFromComponents:dateComponents];
    }
    return self;
}

- (id)initUsingDate:(NSDate *)date {
    if (self = [self init]) {
        _date = date;
    }
    return self;
}

- (id)initUsingSeconds:(int)seconds {
    if (self = [self init]) {
        _date = [NSDate dateWithTimeIntervalSinceReferenceDate:seconds];
    }
    return self;
}

- (NSDate *)date {
    return _date;
}

- (NSString *)stringValue {
    return [_dateFormatter stringFromDate:_date];
}

- (NSString *)stringValueWithFormat:(NSString *)dateFormat {
    NSDateFormatter *localDateFormatter = [_dateFormatter copy];
    localDateFormatter.dateFormat = dateFormat;
    
    return [localDateFormatter stringFromDate:_date];
}

- (instancetype)zeroTime {
    NSDateComponents *dateComponents = [_calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:_date];
    dateComponents.hour = 0;
    dateComponents.minute = 0;
    dateComponents.second = 0;
    
    _date = [_calendar dateFromComponents:dateComponents];

    return self;
}

- (void)setDateFormatUsingString:(NSString *)dateFormatUsingString {
    _dateFormatter.dateFormat = dateFormatUsingString;
}

- (NSString *)dateFormatUsingString {
    return _dateFormatter.dateFormat;
}

- (void)setDateFormatUsingStyle:(NSDateFormatterStyle)dateFormatUsingStyle {
    _dateFormatter.dateStyle = dateFormatUsingStyle;
}

- (NSDateFormatterStyle)dateFormatUsingStyle {
    return _dateFormatter.dateStyle;
}

- (void)setTimeFormatUsingStyle:(NSDateFormatterStyle)timeFormatUsingStyle {
    _dateFormatter.timeStyle = timeFormatUsingStyle;
}

- (NSDateFormatterStyle)timeFormatUsingStyle {
    return _dateFormatter.timeStyle;
}

- (instancetype)daysCalculate:(int)days isForward:(BOOL)isForward {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = days * (isForward ? 1 : -1);
    _date = [_calendar dateByAddingComponents:dateComponents toDate:_date options:0];
    
    return self;
}

- (instancetype)previousDay {
    return [self previousDays:1];
}

- (instancetype)previousDays:(int)days {
    return [self daysCalculate:days isForward:NO];
}

- (instancetype)nextDay {
    return [self nextDays:1];
}

- (instancetype)nextDays:(int)days {
    return [self daysCalculate:days isForward:YES];
}

- (instancetype)weeksCalculate:(int)weeks isForward:(BOOL)isForward {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = (7 * weeks) * (isForward ? 1 : -1);
    _date = [_calendar dateByAddingComponents:dateComponents toDate:_date options:0];
    
    return self;
}

- (instancetype)previousWeek {
    return [self previousWeeks:1];
}

- (instancetype)previousWeeks:(int)weeks {
    return [self weeksCalculate:weeks isForward:NO];
}

- (instancetype)nextWeek {
    return [self nextWeeks:1];
}

- (instancetype)nextWeeks:(int)weeks {
    return [self weeksCalculate:weeks isForward:YES];
}

- (instancetype)monthsCalculate:(int)months isForward:(BOOL)isForward {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = months * (isForward ? 1 : -1);
    _date = [_calendar dateByAddingComponents:dateComponents toDate:_date options:0];
    
    return self;
}

- (instancetype)previousMonth {
    return [self previousMonths:1];
}

- (instancetype)previousMonths:(int)months {
    return [self monthsCalculate:months isForward:NO];
}

- (instancetype)nextMonth {
    return [self nextMonths:1];
}

- (instancetype)nextMonths:(int)months {
    return [self monthsCalculate:months isForward:YES];
}

- (instancetype)yearsCalculate:(int)years isForward:(BOOL)isForward {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year = years * (isForward ? 1 : -1);
    _date = [_calendar dateByAddingComponents:dateComponents toDate:_date options:0];
    
    return self;
}

- (instancetype)previousYear {
    return [self previousYears:1];
}

- (instancetype)previousYears:(int)years {
    return [self yearsCalculate:years isForward:NO];
}

- (instancetype)nextYear {
    return [self nextYears:1];
}

- (instancetype)nextYears:(int)years {
    return [self yearsCalculate:years isForward:YES];
}

- (instancetype)firstDayOfMonth {
    NSDateComponents *dateComponents = [_calendar components:_dateTimeCalendarUnit fromDate:_date];
    dateComponents.day = 1;
    _date = [_calendar dateFromComponents:dateComponents];
    
    return self;
}

- (instancetype)lastDayOfMonth {
    NSDateComponents *dateComponents;
    NSDate *date;
    
    dateComponents = [_calendar components:_dateTimeCalendarUnit fromDate:_date];
    dateComponents.day = 1;
    date = [_calendar dateFromComponents:dateComponents];
    dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = 1;
    date = [_calendar dateByAddingComponents:dateComponents toDate:date options:0];
    dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = -1;
    _date = [_calendar dateByAddingComponents:dateComponents toDate:date options:0];
    
    return self;
}

- (instancetype)firstMonthOfYear {
    NSDateComponents *dateComponents = [_calendar components:_dateTimeCalendarUnit fromDate:_date];
    dateComponents.month = NVMonthUnitJanuary;
    _date = [_calendar dateFromComponents:dateComponents];
    
    return self;
}

- (instancetype)lastMonthOfYear {
    NSDateComponents *dateComponents = [_calendar components:_dateTimeCalendarUnit fromDate:_date];
    dateComponents.month = NVMonthUnitDecember;
    _date = [_calendar dateFromComponents:dateComponents];
    
    return self;
}

- (instancetype)previousDayOfDayName:(NVDayUnit)dayUnit {
    int currentWeekDay = [_calendar components:_dateTimeCalendarUnit fromDate:_date].weekday;
    
    if (currentWeekDay == dayUnit)
        return [self previousWeek];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    
    if (currentWeekDay > dayUnit)
        dateComponents.day = -(currentWeekDay - dayUnit);
    else
        dateComponents.day = -currentWeekDay - (7 - dayUnit);
    
    _date = [_calendar dateByAddingComponents:dateComponents toDate:_date options:0];
    
    return self;
}

- (instancetype)nextDayOfDayName:(NVDayUnit)dayUnit {
    int currentWeekDay = [_calendar components:_dateTimeCalendarUnit fromDate:_date].weekday;
    
    if (currentWeekDay == dayUnit)
        return [self nextWeek];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    
    if (currentWeekDay < dayUnit)
        dateComponents.day = dayUnit - currentWeekDay;
    else
        dateComponents.day = -currentWeekDay + dayUnit;
    
    _date = [_calendar dateByAddingComponents:dateComponents toDate:_date options:0];
    
    return self;
}

- (BOOL)isCurrentDayName:(NVDayUnit)dayUnit {
    return ([_calendar components:_dateTimeCalendarUnit fromDate:_date].weekday == dayUnit);
}

- (BOOL)isCurrentMonthName:(NVMonthUnit)monthUnit {
    return ([_calendar components:_dateTimeCalendarUnit fromDate:_date].month == monthUnit);
}

- (int)year {
    return [_calendar components:_dateTimeCalendarUnit fromDate:_date].year;
}

- (void)setYear:(int)year {
    NSDateComponents *components = [_calendar components:_dateTimeCalendarUnit fromDate:_date];
    components.year = year;
    
    _date = [_calendar dateFromComponents:components];
}

- (int)month {
    return [_calendar components:_dateTimeCalendarUnit fromDate:_date].month;
}

- (void)setMonth:(int)month {
    NSDateComponents *components = [_calendar components:_dateTimeCalendarUnit fromDate:_date];
    components.month = month;
    
    _date = [_calendar dateFromComponents:components];
}

- (int)week {
    return [_calendar components:_dateTimeCalendarUnit fromDate:_date].week;
}

- (int)day {
    return [_calendar components:_dateTimeCalendarUnit fromDate:_date].day;
}

- (void)setDay:(int)day {
    NSDateComponents *components = [_calendar components:_dateTimeCalendarUnit fromDate:_date];
    components.day = day;
    
    _date = [_calendar dateFromComponents:components];
}

- (int)hour {
    return [_calendar components:_dateTimeCalendarUnit fromDate:_date].hour;
}

- (void)setHour:(int)hour {
    NSDateComponents *components = [_calendar components:_dateTimeCalendarUnit fromDate:_date];
    components.hour = hour;
    
    _date = [_calendar dateFromComponents:components];
}

- (int)minute {
    return [_calendar components:_dateTimeCalendarUnit fromDate:_date].minute;
}

- (void)setMinute:(int)minute {
    NSDateComponents *components = [_calendar components:_dateTimeCalendarUnit fromDate:_date];
    components.minute = minute;
    
    _date = [_calendar dateFromComponents:components];
}

- (int)second {
    return [_calendar components:_dateTimeCalendarUnit fromDate:_date].second;
}

- (void)setSecond:(int)second {
    NSDateComponents *components = [_calendar components:_dateTimeCalendarUnit fromDate:_date];
    components.second = second;
    
    _date = [_calendar dateFromComponents:components];
}

@end
