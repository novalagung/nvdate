//
//  NVDate.swift
//  NVDate
//
//  Created by Noval Agung Prayogo on 11/10/15.
//  Copyright © 2015 Noval Agung Prayogo. All rights reserved.
//

import UIKit

enum NVDayUnit: Int {
    case Sunday = 1, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
}

enum NVMonthUnit: Int {
    case January = 1, February, March, April, May, June, July, August, September, October, November, December
}

class NVDate: NSObject {

    var dateFormatter = DateFormatter()
    var ourCalendar = Calendar.current
    var date: Date = Date()
    var dateTimeCalendarUnit: Set<Calendar.Component> = [.year, .month, .weekOfYear, .weekday, .day, .hour, .minute, .second]
    
    private var _timeZone = NSTimeZone.local
    var timeZone: TimeZone {
        get { return _timeZone }
        set {
            _timeZone = newValue
            ourCalendar.timeZone = _timeZone
            dateFormatter.timeZone = _timeZone
        }
    }
    
    private var _dateFormatUsingString: String?
    var dateFormatUsingString: String {
        get { return _dateFormatUsingString! }
        set { _dateFormatUsingString = newValue }
    }

    private var _dateFormatUsingStyle: DateFormatter.Style?
    var dateFormatUsingStyle: DateFormatter.Style {
        get { return _dateFormatUsingStyle! }
        set { _dateFormatUsingStyle = newValue }
    }
    
    private var _timeFormatUsingStyle: DateFormatter.Style?
    var timeFormatUsingStyle: DateFormatter.Style {
        get { return _timeFormatUsingStyle! }
        set { _timeFormatUsingStyle = newValue }
    }
    
    private var _year: Int?
    var year: Int {
        get { return _year! }
        set {
            _year = newValue
            var dateComponents = ourCalendar.dateComponents(dateTimeCalendarUnit, from: date)
            dateComponents.year = _year!
            date = ourCalendar.date(from: dateComponents)!
        }
    }
    
    private var _month: Int?
    var month: Int {
        get { return _month! }
        set {
            _month = newValue
            var dateComponents = ourCalendar.dateComponents(dateTimeCalendarUnit, from: date)
            dateComponents.month = _month!
            date = ourCalendar.date(from: dateComponents)!
        }
    }
    
    var week: Int {
        get {
            let weekOfYear = ourCalendar.dateComponents(dateTimeCalendarUnit, from: date).weekOfYear!
            return weekOfYear
        }
    }
    
    private var _day: Int?
    var day: Int {
        get { return _day! }
        set {
            _day = newValue
            var dateComponents = ourCalendar.dateComponents(dateTimeCalendarUnit, from: date)
            dateComponents.day = _day!
            date = ourCalendar.date(from: dateComponents)!
        }
    }
    
    private var _hour: Int?
    var hour: Int {
        get { return _hour! }
        set {
            _hour = newValue
            var dateComponents = ourCalendar.dateComponents(dateTimeCalendarUnit, from: date)
            dateComponents.hour = _hour!
            date = ourCalendar.date(from: dateComponents)!
        }
    }
    
    private var _minute: Int?
    var minute: Int {
        get { return _minute! }
        set {
            _minute = newValue
            var dateComponents = ourCalendar.dateComponents(dateTimeCalendarUnit, from: date)
            dateComponents.minute = _minute!
            date = ourCalendar.date(from: dateComponents)!
        }
    }
    
    private var _second: Int?
    var second: Int {
        get { return _second! }
        set {
            _second = newValue
            var dateComponents = ourCalendar.dateComponents(dateTimeCalendarUnit, from: date)
            dateComponents.second = _second!
            date = ourCalendar.date(from: dateComponents)!
        }
    }
    
    override init() {
        super.init()
        
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .full
        dateFormatter.timeZone = timeZone
        
        ourCalendar.timeZone = timeZone
    }
    
    convenience init(isUsingToday: Bool) {
        self.init()
        
        date = Date()
    }
    
    convenience init(stringDate: String, dateFormat: String?) {
        self.init()
        
        if (dateFormat != nil) {
            dateFormatter.dateFormat = dateFormat
        }
        
        date = dateFormatter.date(from: stringDate)!
    }
    
    convenience init(year: Int, month: Int, day: Int, hour: Int?, minute: Int?, second: Int?) {
        self.init()
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        if (hour != nil) {
            dateComponents.hour = hour!
        }
        
        if (minute != nil) {
            dateComponents.minute = minute!
        }
        
        if (second != nil) {
            dateComponents.second = second!
        }
        
        date = ourCalendar.date(from: dateComponents)!
    }
    
    convenience init(date: Date) {
        self.init()
        
        self.date = date
    }
    
    convenience init(seconds: TimeInterval) {
        self.init()
        
        date = Date(timeIntervalSinceReferenceDate: seconds)
    }
    
    func stringValue() -> String {
        return dateFormatter.string(from: date)
    }
    
    func stringValue(dateFormat: String) -> String {
        let localDateFormatter = dateFormatter.copy() as! DateFormatter
        localDateFormatter.dateFormat = dateFormat
        
        return localDateFormatter.string(from: date)
    }
    
    func zeroTime() -> NVDate {
        let dateComponents = ourCalendar.dateComponents([.year, .month, .day], from: date)
        date = ourCalendar.date(from: dateComponents)!
        
        return self
    }
    
    private func daysCalculate(days: Int, isForward: Bool) -> NVDate {
        var dateComponents = DateComponents()
        dateComponents.day = days * (isForward ? 1 : -1)
        date = ourCalendar.date(byAdding: dateComponents, to: date, wrappingComponents: true)!
        
        return self
    }
    
    func previousDay() -> NVDate {
        return previousDays(1)
    }
    
    func previousDays(_ days: Int) -> NVDate {
        return daysCalculate(days: days, isForward: false)
    }
    
    func nextDay() -> NVDate {
        return nextDays(1)
    }
    
    func nextDays(_ days: Int) -> NVDate {
        return daysCalculate(days: days, isForward: true)
    }
    
    private func weeksCalculate(_ weeks: Int, isForward: Bool) -> NVDate {
        var dateComponents = DateComponents()
        dateComponents.day = (7 * weeks) * (isForward ? 1 : -1)
        date = ourCalendar.date(byAdding: dateComponents, to: date, wrappingComponents: true)!
        
        return self
    }
    
    func previousWeek() -> NVDate {
        return previousWeeks(1)
    }
    
    func previousWeeks(_ weeks: Int) -> NVDate {
        return weeksCalculate(weeks, isForward: false)
    }
    
    func nextWeek() -> NVDate {
        return nextWeeks(1)
    }
    
    func nextWeeks(_ weeks: Int) -> NVDate {
        return weeksCalculate(weeks, isForward: true)
    }
    
    private func monthsCalculate(_ months: Int, isForward: Bool) -> NVDate {
        var dateComponents = DateComponents()
        dateComponents.month = months * (isForward ? 1 : -1)
        date = ourCalendar.date(byAdding: dateComponents, to: date, wrappingComponents: true)!
        
        return self
    }
    
    func previousMonth() -> NVDate {
        return previousMonths(1)
    }
    
    func previousMonths(_ months: Int) -> NVDate {
        return monthsCalculate(months, isForward: false)
    }
    
    func nextMonth() -> NVDate {
        return nextMonths(1)
    }
    
    func nextMonths(_ months: Int) -> NVDate {
        return monthsCalculate(months, isForward: true)
    }
    
    private func yearsCalculate(_ years: Int, isForward: Bool) -> NVDate {
        var dateComponents = DateComponents()
        dateComponents.year = years * (isForward ? 1 : -1)
        date = ourCalendar.date(byAdding: dateComponents, to: date, wrappingComponents: true)!
        
        return self
    }
    
    func previousYear() -> NVDate {
        return previousYears(1)
    }
    
    func previousYears(_ years: Int) -> NVDate {
        return yearsCalculate(years, isForward: false)
    }
    
    func nextYear() -> NVDate {
        return nextYears(1)
    }
    
    func nextYears(_ years: Int) -> NVDate {
        return yearsCalculate(years, isForward: true)
    }
    
    func firstDayOfMonth() -> NVDate {
        var dateComponents = ourCalendar.dateComponents(dateTimeCalendarUnit, from: date)
        dateComponents.day = 1
        date = ourCalendar.date(from: dateComponents)!
        
        return self
    }
    
    func lastDayOfMonth() -> NVDate {
        var dateComponents: DateComponents
        var date: Date
        
        dateComponents = ourCalendar.dateComponents(dateTimeCalendarUnit, from: self.date)
        dateComponents.day = 1
        date = ourCalendar.date(from: dateComponents)!
        
        dateComponents = DateComponents()
        dateComponents.month = 1
        date = ourCalendar.date(byAdding: dateComponents, to: date, wrappingComponents: true)!
        
        dateComponents = DateComponents()
        dateComponents.day = -1
        self.date = ourCalendar.date(byAdding: dateComponents, to: date, wrappingComponents: true)!
        
        return self
    }
    
    func firstMonthOfYear() -> NVDate {
        var dateComponents = ourCalendar.dateComponents(dateTimeCalendarUnit, from: date)
        dateComponents.month = NVMonthUnit.January.rawValue
        date = ourCalendar.date(from: dateComponents)!
        
        return self
    }
    
    func lastMonthOfYear() -> NVDate {
        var dateComponents = ourCalendar.dateComponents(dateTimeCalendarUnit, from: date)
        dateComponents.month = NVMonthUnit.December.rawValue
        date = ourCalendar.date(from: dateComponents)!
        
        return self
    }
    
    func nearestPreviousDay(dayUnit: NVDayUnit) -> NVDate {
        let currentWeekDay = ourCalendar.dateComponents(dateTimeCalendarUnit, from: date).weekday!
        
        if (currentWeekDay == dayUnit.rawValue) {
            return previousWeek()
        }
        
        var dateComponents = DateComponents()
        
        if (currentWeekDay > dayUnit.rawValue) {
            dateComponents.day = -1 * (currentWeekDay - dayUnit.rawValue)
        } else {
            dateComponents.day = (-1 * currentWeekDay) - (7 - dayUnit.rawValue)
        }
        
        date = ourCalendar.date(byAdding: dateComponents, to: date, wrappingComponents: true)!
        
        return self
    }
    
    func nearestNextDay(dayUnit: NVDayUnit) -> NVDate {
        let currentWeekDay = ourCalendar.dateComponents(dateTimeCalendarUnit, from: date).weekday!
        
        if (currentWeekDay == dayUnit.rawValue) {
            return nextWeek()
        }
        
        var dateComponents = DateComponents()
        
        if (currentWeekDay < dayUnit.rawValue) {
            dateComponents.day = dayUnit.rawValue - currentWeekDay
        } else {
            dateComponents.day = (-1 * currentWeekDay) + dayUnit.rawValue
        }
        
        date = ourCalendar.date(byAdding: dateComponents, to: date, wrappingComponents: true)!
        
        return self
    }
    
    func isCurrentDayName(dayUnit: NVDayUnit) -> Bool {
        return (ourCalendar.dateComponents(dateTimeCalendarUnit, from: date).weekday! == dayUnit.rawValue)
    }
    
    func isCurrentMonthName(monthUnit: NVMonthUnit) -> Bool {
        return (ourCalendar.dateComponents(dateTimeCalendarUnit, from: date).month! == monthUnit.rawValue)
    }
}
