//
//  testTests.swift
//  testTests
//
//  Created by Noval Agung Prayogo on 25/05/18.
//  Copyright © 2018 Noval Agung Prayogo. All rights reserved.
//

import XCTest
@testable import test

class exampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDateObject() {
        let date = Date()
        let nv = NVDate(fromDate: date)
        
        XCTAssertEqual(date, nv.date()!)
    }
    
    func testDateObjectFromStringWithFormat() {
        let dateString = "2018-09-21"
        let dateFormat = "yyyy-MM-dd"
        let nv = NVDate(fromString: dateString, withFormat: dateFormat)
        
        XCTAssertEqual(2018, nv.year())
        XCTAssertEqual(9, nv.month())
        XCTAssertEqual(21, nv.day())
        XCTAssertEqual(dateString, nv.asString(withFormat: dateFormat))
    }
    
    func testDateObjectFromTimeIntervalSinceReferenceDate() {
        let date = Date()
        let nv = NVDate(fromTimeIntervalSinceReferenceDate: date.timeIntervalSinceReferenceDate)
        
        XCTAssertEqual(date, nv.date()!)
    }
    
    func testDateObjectFromYearMonthDayHourMinuteSecond() {
        let nv = NVDate(year: 2018, month: 12, day: 12, hour: 1, minute: 2, second: 3)
        
        XCTAssertEqual(nv.year(), 2018)
        XCTAssertEqual(nv.month(), 12)
        XCTAssertEqual(nv.day(), 12)
        XCTAssertEqual(nv.hour(), 1)
        XCTAssertEqual(nv.minute(), 2)
        XCTAssertEqual(nv.second(), 3)
    }
    
    func testDateObjectFromYearMonthDay() {
        let nv = NVDate(year: 2018, month: 12, day: 12)
        
        XCTAssertEqual(nv.year(), 2018)
        XCTAssertEqual(nv.month(), 12)
        XCTAssertEqual(nv.day(), 12)
    }
    
    func testAsString() {
        let nv = NVDate(year: 2018, month: 12, day: 12, hour: 1, minute: 2, second: 3)
        
        XCTAssert(nv.asString().contains("Wednesday, December 12, 2018 at 1:02:03"))
    }
    
    func testAsStringWithFormat() {
        let nv = NVDate(year: 2018, month: 12, day: 12, hour: 1, minute: 2, second: 3)
        
        XCTAssertEqual(nv.asString(withFormat: "yyyy-MM-dd HH:mm:ss"), "2018-12-12 01:02:03")
    }
    
    func testDateFormatChange() {
        let nv = NVDate()
        nv.dateFormat(setFormat: "yyyy-MM-dd HH:mm:ss")
        
        XCTAssertEqual(nv.dateFormat(), "yyyy-MM-dd HH:mm:ss")
    }
    
    func testDateStyle() {
        let nv = NVDate()
        XCTAssertEqual(nv.dateStyle(), DateFormatter.Style.full)
        
        nv.dateStyle(setStyle: .long)
        XCTAssertEqual(nv.dateStyle(), DateFormatter.Style.long)
    }
    
    func testTimeStyle() {
        let nv = NVDate()
        XCTAssertEqual(nv.timeStyle(), DateFormatter.Style.full)
        
        nv.timeStyle(setStyle: .long)
        XCTAssertEqual(nv.timeStyle(), DateFormatter.Style.long)
    }
    
    func testDay() {
        let nv = NVDate(year: 2018, month: 12, day: 12)
        XCTAssertEqual(nv.day(), 12)
        
        nv.day(setDay: 23)
        XCTAssertEqual(nv.day(), 23)
    }
    
    func testFirstDayOfMonth() {
        let nv = NVDate(year: 2018, month: 12, day: 12)
            .firstDayOfMonth()
        
        XCTAssertEqual(nv.year(), 2018)
        XCTAssertEqual(nv.month(), 12)
        XCTAssertEqual(nv.day(), 1)
    }
    
    func testFirstMonthOfYear() {
        let nv = NVDate(year: 2018, month: 12, day: 12)
            .firstMonthOfYear()
        
        XCTAssertEqual(nv.year(), 2018)
        XCTAssertEqual(nv.month(), 1)
        XCTAssertEqual(nv.day(), 12)
    }
    
    func testHour() {
        let nv = NVDate(year: 2018, month: 12, day: 12, hour: 3, minute: 1, second: 2)
        XCTAssertEqual(nv.hour(), 3)
        
        nv.hour(setHour: 23)
        XCTAssertEqual(nv.hour(), 23)
    }
    
    func testIsThisDayName() {
        let nv = NVDate(year: 2018, month: 5, day: 25)
        
        XCTAssert(nv.isThisDayName(.friday))
        XCTAssert(nv.isTodayName(.friday))
    }
    
    func testIsThisMonthName() {
        let nv = NVDate(year: 2018, month: 5, day: 25)
        
        XCTAssert(nv.isThisMonthName(.may))
    }
    
    func testLastDayOfMonth() {
        let nv = NVDate(year: 2018, month: 5, day: 12)
            .lastDayOfMonth()
        
        XCTAssertEqual(nv.year(), 2018)
        XCTAssertEqual(nv.month(), 5)
        XCTAssertEqual(nv.day(), 31)
    }
    
    func testLastMonthOfYear() {
        let nv = NVDate(year: 2018, month: 5, day: 12)
            .lastMonthOfYear()
        
        XCTAssertEqual(nv.year(), 2018)
        XCTAssertEqual(nv.month(), 12)
        XCTAssertEqual(nv.day(), 12)
    }
    
    func testMinute() {
        let nv = NVDate(year: 2018, month: 12, day: 12, hour: 3, minute: 1, second: 2)
        XCTAssertEqual(nv.minute(), 1)
        
        nv.minute(setMinute: 12)
        XCTAssertEqual(nv.minute(), 12)
    }
    
    func testMonth() {
        let nv = NVDate(year: 2018, month: 12, day: 12)
        XCTAssertEqual(nv.month(), 12)
        
        nv.month(setMonth: 4)
        XCTAssertEqual(nv.month(), 4)
    }
    
//    func testNearestNextDay() {
//        let nv1 = NVDate(year: 2018, month: 5, day: 25)
//            .nearestNextDay(.saturday)
//        XCTAssertEqual(nv1.day(), 26)
//
//        let nv2 = NVDate(year: 2018, month: 5, day: 25)
//            .nearestNextDay(.sunday)
//        XCTAssertEqual(nv2.day(), 27)
//
//        let nv3 = NVDate(year: 2018, month: 5, day: 25)
//            .nearestNextDay(.monday)
//        XCTAssertEqual(nv3.day(), 28)
//
//        let nv4 = NVDate(year: 2018, month: 5, day: 25)
//            .nearestNextDay(.tuesday)
//        XCTAssertEqual(nv4.day(), 29)
//
//        let nv5 = NVDate(year: 2018, month: 5, day: 25)
//            .nearestNextDay(.wednesday)
//        XCTAssertEqual(nv5.day(), 30)
//
//        let nv6 = NVDate(year: 2018, month: 5, day: 25)
//            .nearestNextDay(.thursday)
//        XCTAssertEqual(nv6.day(), 31)
//
//        let nv7 = NVDate(year: 2018, month: 5, day: 25)
//            .nearestNextDay(.friday)
//        XCTAssertEqual(nv7.month(), 6)
//        XCTAssertEqual(nv7.day(), 1)
//    }
//
//    func testNearestPreviousDay() {
//        let nv1 = NVDate(year: 2018, month: 5, day: 25)
//            .nearestPreviousDay(.thursday)
//        XCTAssertEqual(nv1.day(), 24)
//
//        let nv2 = NVDate(year: 2018, month: 5, day: 25)
//            .nearestPreviousDay(.wednesday)
//        XCTAssertEqual(nv2.day(), 23)
//
//        let nv3 = NVDate(year: 2018, month: 5, day: 25)
//            .nearestPreviousDay(.tuesday)
//        XCTAssertEqual(nv3.day(), 22)
//
//        let nv4 = NVDate(year: 2018, month: 5, day: 25)
//            .nearestPreviousDay(.monday)
//        XCTAssertEqual(nv4.day(), 21)
//
//        let nv5 = NVDate(year: 2018, month: 5, day: 25)
//            .nearestPreviousDay(.sunday)
//        XCTAssertEqual(nv5.day(), 20)
//
//        let nv6 = NVDate(year: 2018, month: 5, day: 25)
//            .nearestPreviousDay(.saturday)
//        XCTAssertEqual(nv6.day(), 19)
//
//        let nv7 = NVDate(year: 2018, month: 5, day: 25)
//            .nearestPreviousDay(.friday)
//        XCTAssertEqual(nv7.day(), 18)
//    }
    
    func testNextDay() {
        let nv1 = NVDate(year: 2018, month: 5, day: 25)
            .nextDay()
        XCTAssertEqual(nv1.day(), 26)
        
        let nv2 = NVDate(year: 2018, month: 5, day: 25)
            .nextDay()
            .nextDay()
            .nextDay()
        XCTAssertEqual(nv2.day(), 28)
    }
    
    func testNextDays() {
        let nv1 = NVDate(year: 2018, month: 5, day: 25)
            .nextDays(days: 0)
        XCTAssertEqual(nv1.day(), 25)
        
        let nv2 = NVDate(year: 2018, month: 5, day: 25)
            .nextDays(days: 1)
        XCTAssertEqual(nv2.day(), 26)
        
        let nv3 = NVDate(year: 2018, month: 5, day: 25)
            .nextDays(days: 2)
        XCTAssertEqual(nv3.day(), 27)
        
        let nv4 = NVDate(year: 2018, month: 5, day: 25)
            .nextDays(days: 14)
        XCTAssertEqual(nv4.month(), 6)
        XCTAssertEqual(nv4.day(), 8)
    }
    
    func testNextMonth() {
        let nv1 = NVDate(year: 2018, month: 5, day: 25)
            .nextMonth()
        XCTAssertEqual(nv1.month(), 6)
        XCTAssertEqual(nv1.day(), 25)
        
        let nv2 = NVDate(year: 2018, month: 5, day: 25)
            .nextMonth()
            .nextMonth()
            .nextMonth()
        XCTAssertEqual(nv2.month(), 8)
    }
    
    func testNextMonths() {
        let nv1 = NVDate(year: 2018, month: 5, day: 25)
            .nextMonths(months: 0)
        XCTAssertEqual(nv1.month(), 5)
        XCTAssertEqual(nv1.day(), 25)
        
        let nv2 = NVDate(year: 2018, month: 5, day: 25)
            .nextMonths(months: 1)
        XCTAssertEqual(nv2.month(), 6)
        
        let nv3 = NVDate(year: 2018, month: 5, day: 25)
            .nextMonths(months: 8)
        XCTAssertEqual(nv3.year(), 2019)
        XCTAssertEqual(nv3.month(), 1)
    }
    
    func testNextYear() {
        let nv1 = NVDate(year: 2018, month: 5, day: 25)
            .nextYear()
        XCTAssertEqual(nv1.year(), 2019)
        
        let nv2 = NVDate(year: 2018, month: 5, day: 25)
            .nextYear()
            .nextYear()
            .nextYear()
        XCTAssertEqual(nv2.year(), 2021)
    }
    
    func testNextYears() {
        let nv1 = NVDate(year: 2018, month: 5, day: 25)
            .nextYears(years: 0)
        XCTAssertEqual(nv1.year(), 2018)
        
        let nv2 = NVDate(year: 2018, month: 5, day: 25)
            .nextYears(years: 5)
        XCTAssertEqual(nv2.year(), 2023)
    }
    
    func testPreviousDay() {
        let nv1 = NVDate(year: 2018, month: 5, day: 25)
            .previousDay()
        XCTAssertEqual(nv1.day(), 24)
        
        let nv2 = NVDate(year: 2018, month: 5, day: 25)
            .previousDay()
            .previousDay()
            .previousDay()
        XCTAssertEqual(nv2.day(), 22)
    }
    
    func testPreviousDays() {
        let nv1 = NVDate(year: 2018, month: 5, day: 25)
            .previousDays(days: 0)
        XCTAssertEqual(nv1.day(), 25)
        
        let nv2 = NVDate(year: 2018, month: 5, day: 25)
            .previousDays(days: 1)
        XCTAssertEqual(nv2.day(), 24)
        
        let nv3 = NVDate(year: 2018, month: 5, day: 25)
            .previousDays(days: 14)
        XCTAssertEqual(nv3.day(), 11)
        
        let nv4 = NVDate(year: 2018, month: 5, day: 25)
            .previousDays(days: 34)
        XCTAssertEqual(nv4.month(), 4)
        XCTAssertEqual(nv4.day(), 21)
    }
    
    func testPreviousMonth() {
        let nv1 = NVDate(year: 2018, month: 5, day: 25)
            .previousMonth()
        XCTAssertEqual(nv1.month(), 4)
        XCTAssertEqual(nv1.day(), 25)

        let nv2 = NVDate(year: 2018, month: 5, day: 25)
            .previousMonth()
            .previousMonth()
            .previousMonth()
        XCTAssertEqual(nv2.month(), 2)
    }

    func testPreviousMonths() {
        let nv1 = NVDate(year: 2018, month: 5, day: 25)
            .previousMonths(months: 0)
        XCTAssertEqual(nv1.month(), 5)
        XCTAssertEqual(nv1.day(), 25)

        let nv2 = NVDate(year: 2018, month: 5, day: 25)
            .previousMonths(months: 1)
        XCTAssertEqual(nv2.month(), 4)

        let nv3 = NVDate(year: 2018, month: 5, day: 25)
            .previousMonths(months: 8)
        XCTAssertEqual(nv3.year(), 2017)
        XCTAssertEqual(nv3.month(), 9)
    }

//    func testPreviousYear() {
//        let nv1 = NVDate(year: 2018, month: 5, day: 25)
//            .previousYear()
//        XCTAssertEqual(nv1.year(), 2019)
//
//        let nv2 = NVDate(year: 2018, month: 5, day: 25)
//            .previousYear()
//            .previousYear()
//            .previousYear()
//        XCTAssertEqual(nv2.year(), 2021)
//    }
//
//    func testPreviousYears() {
//        let nv1 = NVDate(year: 2018, month: 5, day: 25)
//            .previousYears(years: 0)
//        XCTAssertEqual(nv1.year(), 2018)
//
//        let nv2 = NVDate(year: 2018, month: 5, day: 25)
//            .previousYears(years: 5)
//        XCTAssertEqual(nv2.year(), 2023)
//    }
    
//    func testThisDayName() {
//        let nv = NVDate(year: 2018, month: 5, day: 25)
//
//        XCTAssertEqual(nv.thisDayName(), NVDate.DayName.friday)
//        XCTAssertEqual(nv.todayName(), NVDate.DayName.friday)
//    }
//
//    func testThisMonthName() {
//        let nv = NVDate(year: 2018, month: 5, day: 25)
//
//        XCTAssertEqual(nv.thisMonthName(), NVDate.MonthName.may)
//    }
    
    func testAsdf() {
        let nv = NVDate()
    }
}
