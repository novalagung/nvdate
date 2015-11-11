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

    var dateFormatter: NSDateFormatter = NSDateFormatter()
    var ourCalendar: NSCalendar = NSCalendar.currentCalendar()
    var date: NSDate = NSDate()
    var dateTimeCalendarUnit: NSCalendarUnit = [.Year, .Month, .WeekOfYear, .Weekday, .Day, .Hour, .Minute, .Second]
    
    private var _timeZone: NSTimeZone = NSTimeZone.localTimeZone()
    var timeZone: NSTimeZone {
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

    private var _dateFormatUsingStyle: NSDateFormatterStyle?
    var dateFormatUsingStyle: NSDateFormatterStyle {
        get { return _dateFormatUsingStyle! }
        set { _dateFormatUsingStyle = newValue }
    }
    
    private var _timeFormatUsingStyle: NSDateFormatterStyle?
    var timeFormatUsingStyle: NSDateFormatterStyle {
        get { return _timeFormatUsingStyle! }
        set { _timeFormatUsingStyle = newValue }
    }
    
    private var _year: Int?
    var year: Int {
        get { return _year! }
        set {
            _year = newValue
            let dateComponents = ourCalendar.components(dateTimeCalendarUnit, fromDate: date)
            dateComponents.year = _year!
            date = ourCalendar.dateFromComponents(dateComponents)!
        }
    }
    
    private var _month: Int?
    var month: Int {
        get { return _month! }
        set {
            _month = newValue
            let dateComponents = ourCalendar.components(dateTimeCalendarUnit, fromDate: date)
            dateComponents.month = _month!
            date = ourCalendar.dateFromComponents(dateComponents)!
        }
    }
    
    var week: Int {
        get {
            return ourCalendar.components(dateTimeCalendarUnit, fromDate: date).weekOfYear
        }
    }
    
    private var _day: Int?
    var day: Int {
        get { return _day! }
        set {
            _day = newValue
            let dateComponents = ourCalendar.components(dateTimeCalendarUnit, fromDate: date)
            dateComponents.day = _day!
            date = ourCalendar.dateFromComponents(dateComponents)!
        }
    }
    
    private var _hour: Int?
    var hour: Int {
        get { return _hour! }
        set {
            _hour = newValue
            let dateComponents = ourCalendar.components(dateTimeCalendarUnit, fromDate: date)
            dateComponents.hour = _hour!
            date = ourCalendar.dateFromComponents(dateComponents)!
        }
    }
    
    private var _minute: Int?
    var minute: Int {
        get { return _minute! }
        set {
            _minute = newValue
            let dateComponents = ourCalendar.components(dateTimeCalendarUnit, fromDate: date)
            dateComponents.minute = _minute!
            date = ourCalendar.dateFromComponents(dateComponents)!
        }
    }
    
    private var _second: Int?
    var second: Int {
        get { return _second! }
        set {
            _second = newValue
            let dateComponents = ourCalendar.components(dateTimeCalendarUnit, fromDate: date)
            dateComponents.second = _second!
            date = ourCalendar.dateFromComponents(dateComponents)!
        }
    }
    
    override init() {
        super.init()
        
        dateFormatter.dateStyle = .FullStyle
        dateFormatter.timeStyle = .FullStyle
        dateFormatter.timeZone = timeZone
        
        ourCalendar.timeZone = timeZone
    }
    
    convenience init(isUsingToday: Bool) {
        self.init()
        
        date = NSDate()
    }
    
    convenience init(stringDate: String, dateFormat: String?) {
        self.init()
        
        if (dateFormat != nil) {
            dateFormatter.dateFormat = dateFormat
        }
        
        date = dateFormatter.dateFromString(stringDate)!
    }
    
    convenience init(year: Int, month: Int, day: Int, hour: Int?, minute: Int?, second: Int?) {
        self.init()
        
        let dateComponents = NSDateComponents()
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
        
        date = ourCalendar.dateFromComponents(dateComponents)!
    }
    
    convenience init(date: NSDate) {
        self.init()
        
        self.date = date
    }
    
    convenience init(seconds: NSTimeInterval) {
        self.init()
        
        date = NSDate(timeIntervalSinceReferenceDate: seconds)
    }
    
    func stringValue() -> String {
        return dateFormatter.stringFromDate(date)
    }
    
    func stringValue(dateFormat: String) -> String {
        let localDateFormatter = dateFormatter.copy() as! NSDateFormatter
        localDateFormatter.dateFormat = dateFormat
        
        return localDateFormatter.stringFromDate(date)
    }
    
    func zeroTime() -> NVDate {
        let dateComponents = ourCalendar.components([.Year, .Month, .Day], fromDate: date)
        date = ourCalendar.dateFromComponents(dateComponents)!
        
        return self
    }
    
    private func daysCalculate(days: Int, isForward: Bool) -> NVDate {
        let dateComponents = NSDateComponents()
        dateComponents.day = days * (isForward ? 1 : -1)
        date = ourCalendar.dateByAddingComponents(dateComponents, toDate: date, options: .MatchStrictly)!
        
        return self
    }
    
    func previousDay() -> NVDate {
        return previousDays(1)
    }
    
    func previousDays(days: Int?) -> NVDate {
        if (days != nil) {
            return daysCalculate(days!, isForward: false)
        }
        
        return previousDays(1)
    }
    
    func nextDay() -> NVDate {
        return nextDays(1)
    }
    
    func nextDays(days: Int?) -> NVDate {
        if (days != nil) {
            return daysCalculate(days!, isForward: true)
        }
        
        return nextDays(1)
    }
    
    private func weeksCalculate(weeks: Int, isForward: Bool) -> NVDate {
        let dateComponents = NSDateComponents()
        dateComponents.day = (7 * weeks) * (isForward ? 1 : -1)
        date = ourCalendar.dateByAddingComponents(dateComponents, toDate: date, options: .MatchStrictly)!
        
        return self
    }
    
    func previousWeek() -> NVDate {
        return previousWeeks(1)
    }
    
    func previousWeeks(weeks: Int?) -> NVDate {
        if (weeks != nil) {
            return weeksCalculate(weeks!, isForward: false)
        }
        
        return previousWeeks(1)
    }
    
    func nextWeek() -> NVDate {
        return nextWeeks(1)
    }
    
    func nextWeeks(weeks: Int?) -> NVDate {
        if (weeks != nil) {
            return weeksCalculate(weeks!, isForward: true)
        }
        
        return nextWeeks(1)
    }
    
    private func monthsCalculate(months: Int, isForward: Bool) -> NVDate {
        let dateComponents = NSDateComponents()
        dateComponents.month = months * (isForward ? 1 : -1)
        date = ourCalendar.dateByAddingComponents(dateComponents, toDate: date, options: .MatchStrictly)!
        
        return self
    }
    
    func previousMonth() -> NVDate {
        return previousMonths(1)
    }
    
    func previousMonths(months: Int?) -> NVDate {
        if (months != nil) {
            return monthsCalculate(months!, isForward: false)
        }
        
        return previousMonths(1)
    }
    
    func nextMonth() -> NVDate {
        return nextMonths(1)
    }
    
    func nextMonths(months: Int?) -> NVDate {
        if (months != nil) {
            return monthsCalculate(months!, isForward: true)
        }
        
        return nextMonths(1)
    }
    
    private func yearsCalculate(years: Int, isForward: Bool) -> NVDate {
        let dateComponents = NSDateComponents()
        dateComponents.year = years * (isForward ? 1 : -1)
        date = ourCalendar.dateByAddingComponents(dateComponents, toDate: date, options: .MatchStrictly)!
        
        return self
    }
    
    func previousYear() -> NVDate {
        return previousYears(1)
    }
    
    func previousYears(years: Int?) -> NVDate {
        if (years != nil) {
            return yearsCalculate(years!, isForward: false)
        }
        
        return previousYears(1)
    }
    
    func nextYear() -> NVDate {
        return nextYears(1)
    }
    
    func nextYears(years: Int?) -> NVDate {
        if (years != nil) {
            return yearsCalculate(years!, isForward: true)
        }
        
        return nextYears(1)
    }
    
    func firstDayOfMonth() -> NVDate {
        let dateComponents = ourCalendar.components(dateTimeCalendarUnit, fromDate: date)
        dateComponents.day = 1
        date = ourCalendar.dateFromComponents(dateComponents)!
        
        return self
    }
    
    func lastDayOfMonth() -> NVDate {
        var dateComponents: NSDateComponents
        var date: NSDate
        
        dateComponents = ourCalendar.components(dateTimeCalendarUnit, fromDate: self.date)
        dateComponents.day = 1
        date = ourCalendar.dateFromComponents(dateComponents)!
        
        dateComponents = NSDateComponents()
        dateComponents.month = 1
        date = ourCalendar.dateByAddingComponents(dateComponents, toDate: date, options: .MatchStrictly)!
        
        dateComponents = NSDateComponents()
        dateComponents.day = -1
        self.date = ourCalendar.dateByAddingComponents(dateComponents, toDate: date, options: .MatchStrictly)!
        
        return self
    }
    
    func firstMonthOfYear() -> NVDate {
        let dateComponents = ourCalendar.components(dateTimeCalendarUnit, fromDate: date)
        dateComponents.month = NVMonthUnit.January.rawValue
        date = ourCalendar.dateFromComponents(dateComponents)!
        
        return self
    }
    
    func lastMonthOfYear() -> NVDate {
        let dateComponents = ourCalendar.components(dateTimeCalendarUnit, fromDate: date)
        dateComponents.month = NVMonthUnit.December.rawValue
        date = ourCalendar.dateFromComponents(dateComponents)!
        
        return self
    }
    
    func nearestPreviousDay(dayUnit: NVDayUnit) -> NVDate {
        let currentWeekDay = ourCalendar.components(dateTimeCalendarUnit, fromDate: date).weekday
        
        if (currentWeekDay == dayUnit.rawValue) {
            return previousWeek()
        }
        
        let dateComponents = NSDateComponents()
        
        if (currentWeekDay > dayUnit.rawValue) {
            dateComponents.day = -1 * (currentWeekDay - dayUnit.rawValue)
        } else {
            dateComponents.day = (-1 * currentWeekDay) - (7 - dayUnit.rawValue)
        }
        
        date = ourCalendar.dateByAddingComponents(dateComponents, toDate: date, options: .MatchStrictly)!
        
        return self
    }
    
    func nearestNextDay(dayUnit: NVDayUnit) -> NVDate {
        let currentWeekDay = ourCalendar.components(dateTimeCalendarUnit, fromDate: date).weekday
        
        if (currentWeekDay == dayUnit.rawValue) {
            return nextWeek()
        }
        
        let dateComponents = NSDateComponents()
        
        if (currentWeekDay < dayUnit.rawValue) {
            dateComponents.day = dayUnit.rawValue - currentWeekDay
        } else {
            dateComponents.day = (-1 * currentWeekDay) + dayUnit.rawValue
        }
        
        date = ourCalendar.dateByAddingComponents(dateComponents, toDate: date, options: .MatchStrictly)!
        
        return self
    }
    
    func isCurrentDayName(dayUnit: NVDayUnit) -> Bool {
        return (ourCalendar.components(dateTimeCalendarUnit, fromDate: date).weekday == dayUnit.rawValue)
    }
    
    func isCurrentMonthName(monthUnit: NVMonthUnit) -> Bool {
        return (ourCalendar.components(dateTimeCalendarUnit, fromDate: date).month == monthUnit.rawValue)
    }
}
