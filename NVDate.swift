//
//  NVDate.swift
//  NVDate
//
//  Created by Noval Agung Prayogo on 11/10/15.
//  Copyright © 2015 Noval Agung Prayogo. All rights reserved.
//

import Foundation

public class NVDate: NSObject {
    
    public enum DayName: Int {
        case sunday = 1
        case monday = 2
        case tuesday = 3
        case wednesday = 4
        case thursday = 5
        case friday = 6
        case saturday = 7
    }
    private var _dayNames: [DayName] = [.sunday, .monday, .tuesday, .wednesday, .thursday, .friday, .saturday]
    
    public enum MonthName: Int {
        case january = 1
        case february = 2
        case march = 3
        case april = 4
        case may = 5
        case june = 6
        case july = 7
        case august = 8
        case september = 9
        case october = 10
        case november = 11
        case december = 12
    }
    private var _monthsNames: [MonthName] = [.january, .february, .march, .april, .may, .june, .july, .august, .september, .october, .november, .december]
    
    // ============= private props

    fileprivate var _date: Date?
    fileprivate var _dateFormatter: DateFormatter = DateFormatter()
    fileprivate var _calendar = Calendar.current
    fileprivate var _calendarNameDateTime: Set<Calendar.Component> = [.year, .month, .weekOfYear, .weekOfMonth, .weekday, .day, .hour, .minute, .second]
    fileprivate var _calendarNameDateOnly: Set<Calendar.Component> = [.year, .month, .day]
    fileprivate var _timeZone = TimeZone.current
    
    // ============= private funcs
    
    fileprivate func _dateComponentsFromCurrentDate() -> DateComponents {
        return _calendar.dateComponents(_calendarNameDateTime, from: _date!)
    }
    
    fileprivate func _dateComponentsFromCurrentDate(calendarName: Set<Calendar.Component>) -> DateComponents {
        return _calendar.dateComponents(calendarName, from: _date!)
    }
    
    fileprivate func _dateByAddingComponentsToCurrentDate(_ components: DateComponents) -> Date? {
        if _date != nil {
            return _calendar.date(byAdding: components, to: _date!, wrappingComponents: false)
        }
        
        return _date
    }
    
    fileprivate func _dateByAddingDay(days: Int, isForward: Bool) -> NVDate {
        if _date != nil {
            var components = DateComponents()
            components.day = days * (isForward ? 1 : -1)
            _date = _dateByAddingComponentsToCurrentDate(components)
        }
        
        return self
    }
    
    fileprivate func _dateByAddingWeek(weeks: Int, isForward: Bool) -> NVDate {
        if _date != nil {
            var components = DateComponents()
            components.day = (7 * weeks) * (isForward ? 1 : -1)
            _date = _dateByAddingComponentsToCurrentDate(components)
        }
        
        return self
    }
    
    fileprivate func _dateByAddingMonth(months: Int, isForward: Bool) -> NVDate {
        if _date != nil {
            var components = DateComponents()
            components.month = months * (isForward ? 1 : -1)
            _date = _dateByAddingComponentsToCurrentDate(components)
        }
        
        return self
    }
    
    fileprivate func _dateByAddingYear(years: Int, isForward: Bool) -> NVDate {
        if _date != nil {
            var components = DateComponents()
            components.year = years * (isForward ? 1 : -1)
            _date = _dateByAddingComponentsToCurrentDate(components)
        }
        
        return self
    }
    
    // ============= init
    
    public override init() {
        super.init()
        
        _dateFormatter.dateStyle = .full
        _dateFormatter.timeStyle = .full
        _dateFormatter.timeZone = _timeZone
        
        _calendar.timeZone = _timeZone
        
        _date = Date()
    }
    
    public convenience init(fromString: String, withFormat: String) {
        self.init()

        _dateFormatter.dateFormat = withFormat
        _date = _dateFormatter.date(from: fromString)
    }
    
    public convenience init(year: Int, month: Int, day: Int) {
        self.init()
        
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        _date = _calendar.date(from: components)
    }

    public convenience init(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) {
        self.init()
        
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        
        _date = _calendar.date(from: components)
    }
    
    public convenience init(fromDate: Date) {
        self.init()
        
        _date = fromDate
    }
    
    public convenience init(fromTimeIntervalSinceReferenceDate: TimeInterval) {
        self.init()
        
        _date = Date(timeIntervalSinceReferenceDate: fromTimeIntervalSinceReferenceDate)
    }
    
    // ============= public functions
    
    public func date() -> Date? {
        return _date
    }
    
    public func asString() -> String {
        if _date != nil {
            return _dateFormatter.string(from: _date!)
        }
        
        return ""
    }
    
    public func asString(withFormat: String) -> String {
        let localDateFormatter = _dateFormatter.copy() as! DateFormatter
        localDateFormatter.dateFormat = withFormat
        
        if _date != nil {
            return localDateFormatter.string(from: _date!)
        }
        
        return ""
    }
    
    public func setTimeAsZero() -> NVDate {
        if _date != nil {
            var components = _dateComponentsFromCurrentDate(calendarName: _calendarNameDateOnly)
            components.hour = 0
            components.minute = 0
            components.second = 0
            
            _date = _calendar.date(from: components)
        }
        
        return self
    }
    
    public func dateFormat() -> String {
        return _dateFormatter.dateFormat
    }
    
    public func dateFormat(setFormat: String) {
        _dateFormatter.dateFormat = setFormat
    }
    
    public func dateStyle() -> DateFormatter.Style {
        return _dateFormatter.dateStyle
    }
    
    public func dateStyle(setStyle: DateFormatter.Style) {
        _dateFormatter.dateStyle = setStyle
    }
    
    public func timeStyle() -> DateFormatter.Style {
        return _dateFormatter.timeStyle
    }
    
    public func timeStyle(setStyle: DateFormatter.Style) {
        _dateFormatter.timeStyle = setStyle
    }
    
    public func timeZone() -> TimeZone {
        return _timeZone
    }
    
    public func timeZone(setTimeZone: TimeZone) {
        _timeZone = setTimeZone
        _calendar.timeZone = setTimeZone
        _dateFormatter.timeZone = setTimeZone
    }
    
    // ================ date and time related functions
    
    public func nextDays(days: Int) -> NVDate {
        return _dateByAddingDay(days: days, isForward: true)
    }
    
    public func nextDay() -> NVDate {
        return nextDays(days: 1)
    }
    
    public func tomorrow() -> NVDate {
        return nextDay()
    }
    
    public func previousDays(diff: Int) -> NVDate {
        return _dateByAddingDay(days: diff, isForward: false)
    }
    
    public func previousDay() -> NVDate {
        return previousDays(diff: 1)
    }
    
    public func yesterday() -> NVDate {
        return previousDay()
    }
    
    public func nextWeeks(diff: Int) -> NVDate {
        return _dateByAddingWeek(weeks: diff, isForward: true)
    }
    
    public func nextWeek() -> NVDate {
        return nextWeeks(diff: 1)
    }
    
    public func previousWeeks(diff: Int) -> NVDate {
        return _dateByAddingWeek(weeks: diff, isForward: false)
    }
    
    public func previousWeek() -> NVDate {
        return previousWeeks(diff: 1)
    }
    
    public func nextMonths(diff: Int) -> NVDate {
        return _dateByAddingMonth(months: diff, isForward: true)
    }
    
    public func nextMonth() -> NVDate {
        return nextMonths(diff: 1)
    }
    
    public func previousMonths(diff: Int) -> NVDate {
        return _dateByAddingMonth(months: diff, isForward: false)
    }
    
    public func previousMonth() -> NVDate {
        return previousMonths(diff: 1)
    }
    
    public func nextYears(diff: Int) -> NVDate {
        return _dateByAddingYear(years: diff, isForward: true)
    }
    
    public func nextYear() -> NVDate {
        return nextYears(diff: 1)
    }
    
    public func previousYears(diff: Int) -> NVDate {
        return _dateByAddingYear(years: diff, isForward: false)
    }
    
    public func previousYear() -> NVDate {
        return previousYears(diff: 1)
    }
    
    public func firstDayOfMonth() -> NVDate {
        if _date != nil {
            var components = _dateComponentsFromCurrentDate()
            components.day = 1
            _date = _calendar.date(from: components)
        }
        
        return self
    }
    
    public func lastDayOfMonth() -> NVDate {
        if _date != nil {
            var components = _dateComponentsFromCurrentDate()
            components.day = 1
            _date = _calendar.date(from: components)
            
            components = DateComponents()
            components.month = 1
            _date = _dateByAddingComponentsToCurrentDate(components)
            
            components = DateComponents()
            components.day = -1
            _date = _dateByAddingComponentsToCurrentDate(components)
        }
        
        return self
    }
    
    public func firstMonthOfYear() -> NVDate {
        if _date != nil {
            var components = _dateComponentsFromCurrentDate()
            components.month = MonthName.january.rawValue
            _date = _calendar.date(from: components)
        }
        
        return self
    }
    
    public func lastMonthOfYear() -> NVDate {
        if _date != nil {
            var components = _dateComponentsFromCurrentDate()
            components.month = MonthName.december.rawValue
            _date = _calendar.date(from: components)
        }
        
        return self
    }
    
    public func nearestPreviousDay(_ dayName: DayName) -> NVDate {
        if _date != nil {
            
            var components = _dateComponentsFromCurrentDate()
            if let currentWeekDay = components.weekday {
                
                if currentWeekDay == dayName.rawValue {
                    return self.previousWeek()
                }
                
                components = DateComponents()
                
                if currentWeekDay > dayName.rawValue {
                    components.day = -(currentWeekDay - dayName.rawValue)
                } else {
                    components.day = -currentWeekDay - (7 - dayName.rawValue)
                }
                
                _date = _dateByAddingComponentsToCurrentDate(components)
            }
        }
        
        return self
    }
    
    public func nearestNextDay(_ dayName: DayName) -> NVDate {
        if _date != nil {
            
            var components = _dateComponentsFromCurrentDate()
            if let currentWeekDay = components.weekday {
                
                if currentWeekDay == dayName.rawValue {
                    return self.nextWeek()
                }
                
                components = DateComponents()
                
                if currentWeekDay < dayName.rawValue {
                    components.day = dayName.rawValue - currentWeekDay
                } else {
                    components.day = 7 - (currentWeekDay - dayName.rawValue)
                }
                
                _date = _dateByAddingComponentsToCurrentDate(components)
            }
        }
        
        return self
    }
    
    public func thisDayName() -> DayName {
        if _date != nil {
            let components = _dateComponentsFromCurrentDate()
            
            for dayName in _dayNames {
                if dayName.rawValue == components.weekday {
                    return dayName
                }
            }
        }
        
        return DayName.sunday
    }
    
    public func todayName() -> DayName {
        return thisDayName()
    }
    
    public func isThisDayName(_ dayName: DayName) -> Bool {
        if _date != nil {
            let components = _dateComponentsFromCurrentDate()
            return components.weekday == dayName.rawValue
        }
        
        return false
    }
    
    public func isTodayName(_ dayName: DayName) -> Bool {
        return isThisDayName(dayName)
    }
    
    public func thisMonthName() -> MonthName {
        if _date != nil {
            let components = _dateComponentsFromCurrentDate()
            
            for monthName in _monthsNames {
                if monthName.rawValue == components.month {
                    return monthName
                }
            }
        }
        
        return MonthName.january
    }
    
    public func isThisMonthName(_ monthName: MonthName) -> Bool {
        let components = _dateComponentsFromCurrentDate()
        return components.month == monthName.rawValue
    }
    
    public func year() -> Int {
        let components = _dateComponentsFromCurrentDate()
        return components.year!
    }
    
    public func year(setYear: Int) {
        var components = _dateComponentsFromCurrentDate()
        components.year = setYear
        
        _date = _calendar.date(from: components)
    }
    
    public func month() -> Int {
        let components = _dateComponentsFromCurrentDate()
        return components.month!
    }
    
    public func month(setMonth: Int) {
        var components = _dateComponentsFromCurrentDate()
        components.month = setMonth
        
        _date = _calendar.date(from: components)
    }
    
    public func weekOfYear() -> Int {
        let components = _dateComponentsFromCurrentDate()
        return components.weekOfYear!
    }
    
    public func weekOfMonth() -> Int {
        let components = _dateComponentsFromCurrentDate()
        return components.weekOfMonth!
    }
    
    public func day() -> Int {
        let components = _dateComponentsFromCurrentDate()
        return components.day!
    }
    
    public func day(setDay: Int) {
        var components = _dateComponentsFromCurrentDate()
        components.day = setDay
        
        _date = _calendar.date(from: components)
    }
    
    public func hour() -> Int {
        let components = _dateComponentsFromCurrentDate()
        return components.hour!
    }
    
    public func hour(setHour: Int) {
        var components = _dateComponentsFromCurrentDate()
        components.hour = setHour
        
        _date = _calendar.date(from: components)
    }
    
    public func minute() -> Int {
        let components = _dateComponentsFromCurrentDate()
        return components.minute!
    }
    
    public func minute(setMinute: Int) {
        var components = _dateComponentsFromCurrentDate()
        components.minute = setMinute
        
        _date = _calendar.date(from: components)
    }
    
    public func second() -> Int {
        let components = _dateComponentsFromCurrentDate()
        return components.second!
    }
    
    public func second(setSecond: Int) {
        var components = _dateComponentsFromCurrentDate()
        components.second = setSecond
        
        _date = _calendar.date(from: components)
    }
}
