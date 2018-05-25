//
//  exampleTests.swift
//  exampleTests
//
//  Created by Noval Agung Prayogo on 24/05/18.
//  Copyright © 2018 Noval Agung Prayogo. All rights reserved.
//

import XCTest
@testable import example

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
    
    func testAsdf() {
        print("----", NVDate().dateFormat())
    }
}
