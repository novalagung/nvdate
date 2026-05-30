import XCTest
import NVDate

final class NVDateTests: XCTestCase {
    func testInitializesFromDate() {
        let rawDate = Date(timeIntervalSinceReferenceDate: 123_456)
        let date = NVDate(fromDate: rawDate)

        XCTAssertEqual(date.date(), rawDate)
    }

    func testInitializesFromReferenceTimeInterval() {
        let interval: TimeInterval = 987_654
        let date = NVDate(fromTimeIntervalSinceReferenceDate: interval)

        XCTAssertEqual(date.date(), Date(timeIntervalSinceReferenceDate: interval))
    }

    func testInitializesFromFormattedString() {
        let date = NVDate(fromString: "2018-09-21 04:05:06", withFormat: "yyyy-MM-dd HH:mm:ss")

        XCTAssertEqual(date.year(), 2018)
        XCTAssertEqual(date.month(), 9)
        XCTAssertEqual(date.day(), 21)
        XCTAssertEqual(date.hour(), 4)
        XCTAssertEqual(date.minute(), 5)
        XCTAssertEqual(date.second(), 6)
    }

    func testInvalidFormattedStringKeepsSafeStringMethodsEmpty() {
        let date = NVDate(fromString: "not-a-date", withFormat: "yyyy-MM-dd")

        XCTAssertNil(date.date())
        XCTAssertEqual(date.asString(), "")
        XCTAssertEqual(date.asString(withFormat: "yyyy-MM-dd"), "")
    }

    func testFormatsWithExplicitFormat() {
        let date = NVDate(year: 2018, month: 12, day: 12, hour: 1, minute: 2, second: 3)

        XCTAssertEqual(date.asString(withFormat: "yyyy-MM-dd HH:mm:ss"), "2018-12-12 01:02:03")
    }

    func testFormatsWithConfiguredFormatter() {
        let date = NVDate(year: 2018, month: 12, day: 12, hour: 1, minute: 2, second: 3)

        date.dateFormat(setFormat: "yyyy-MM-dd HH:mm:ss")

        XCTAssertEqual(date.asString(), "2018-12-12 01:02:03")
    }

    func testFormatterSettingsCanBeChanged() {
        let date = NVDate()

        date.dateFormat(setFormat: "yyyy-MM-dd")
        XCTAssertEqual(date.dateFormat(), "yyyy-MM-dd")

        date.dateStyle(setStyle: .long)
        date.timeStyle(setStyle: .short)

        XCTAssertEqual(date.dateStyle(), .long)
        XCTAssertEqual(date.timeStyle(), .short)
    }

    func testTimeZoneSettingUpdatesFormatterAndCalendar() {
        let rawDate = Date(timeIntervalSince1970: 1_577_838_600)
        let date = NVDate(fromDate: rawDate)

        date.timeZone(setTimeZone: TimeZone(secondsFromGMT: 0)!)
        XCTAssertEqual(date.timeZone(), TimeZone(secondsFromGMT: 0)!)
        XCTAssertEqual(date.asString(withFormat: "yyyy-MM-dd HH:mm"), "2020-01-01 00:30")

        date.timeZone(setTimeZone: TimeZone(secondsFromGMT: 7 * 60 * 60)!)
        XCTAssertEqual(date.asString(withFormat: "yyyy-MM-dd HH:mm"), "2020-01-01 07:30")
    }

    func testSetTimeAsZero() {
        let date = NVDate(year: 2018, month: 12, day: 12, hour: 3, minute: 1, second: 2)
            .setTimeAsZero()

        XCTAssertEqual(date.hour(), 0)
        XCTAssertEqual(date.minute(), 0)
        XCTAssertEqual(date.second(), 0)
    }

    func testDateComponentSetters() {
        let date = NVDate(year: 2018, month: 12, day: 12, hour: 3, minute: 1, second: 2)

        date.year(setYear: 2020)
        date.month(setMonth: 4)
        date.day(setDay: 23)
        date.hour(setHour: 13)
        date.minute(setMinute: 14)
        date.second(setSecond: 15)

        XCTAssertEqual(date.asString(withFormat: "yyyy-MM-dd HH:mm:ss"), "2020-04-23 13:14:15")
    }

    func testDayArithmetic() {
        XCTAssertEqual(NVDate(year: 2018, month: 5, day: 25).nextDay().day(), 26)
        XCTAssertEqual(NVDate(year: 2018, month: 5, day: 25).tomorrow().day(), 26)
        XCTAssertEqual(NVDate(year: 2018, month: 5, day: 25).previousDay().day(), 24)
        XCTAssertEqual(NVDate(year: 2018, month: 5, day: 25).yesterday().day(), 24)

        let nextDays = NVDate(year: 2018, month: 5, day: 25).nextDays(days: 14)
        XCTAssertEqual(nextDays.month(), 6)
        XCTAssertEqual(nextDays.day(), 8)

        let previousDays = NVDate(year: 2018, month: 5, day: 25).previousDays(diff: 34)
        XCTAssertEqual(previousDays.month(), 4)
        XCTAssertEqual(previousDays.day(), 21)
    }

    func testWeekMonthAndYearArithmetic() {
        XCTAssertEqual(NVDate(year: 2018, month: 5, day: 25).nextWeek().day(), 1)
        XCTAssertEqual(NVDate(year: 2018, month: 5, day: 25).previousWeek().day(), 18)

        let nextMonths = NVDate(year: 2018, month: 5, day: 25).nextMonths(diff: 8)
        XCTAssertEqual(nextMonths.year(), 2019)
        XCTAssertEqual(nextMonths.month(), 1)

        let previousMonths = NVDate(year: 2018, month: 5, day: 25).previousMonths(diff: 8)
        XCTAssertEqual(previousMonths.year(), 2017)
        XCTAssertEqual(previousMonths.month(), 9)

        XCTAssertEqual(NVDate(year: 2018, month: 5, day: 25).nextMonth().month(), 6)
        XCTAssertEqual(NVDate(year: 2018, month: 5, day: 25).previousMonth().month(), 4)

        XCTAssertEqual(NVDate(year: 2018, month: 5, day: 25).nextYear().year(), 2019)
        XCTAssertEqual(NVDate(year: 2018, month: 5, day: 25).previousYear().year(), 2017)
        XCTAssertEqual(NVDate(year: 2018, month: 5, day: 25).nextYears(diff: 5).year(), 2023)
        XCTAssertEqual(NVDate(year: 2018, month: 5, day: 25).previousYears(diff: 19).year(), 1999)
    }

    func testMonthAndYearBoundaries() {
        let firstDay = NVDate(year: 2018, month: 12, day: 12, hour: 3, minute: 4, second: 5)
            .firstDayOfMonth()
        XCTAssertEqual(firstDay.day(), 1)
        XCTAssertEqual(firstDay.hour(), 3)

        let lastDay = NVDate(year: 2020, month: 2, day: 12)
            .lastDayOfMonth()
        XCTAssertEqual(lastDay.year(), 2020)
        XCTAssertEqual(lastDay.month(), 2)
        XCTAssertEqual(lastDay.day(), 29)

        let firstMonth = NVDate(year: 2018, month: 12, day: 12)
            .firstMonthOfYear()
        XCTAssertEqual(firstMonth.month(), 1)
        XCTAssertEqual(firstMonth.day(), 12)

        let lastMonth = NVDate(year: 2018, month: 5, day: 12)
            .lastMonthOfYear()
        XCTAssertEqual(lastMonth.month(), 12)
        XCTAssertEqual(lastMonth.day(), 12)
    }

    func testNearestWeekdayNavigation() {
        let base = NVDate(year: 2018, month: 5, day: 23)

        XCTAssertEqual(NVDate(fromDate: base.date()!).nearestNextDay(.thursday).day(), 24)
        XCTAssertEqual(NVDate(fromDate: base.date()!).nearestNextDay(.wednesday).day(), 30)
        XCTAssertEqual(NVDate(fromDate: base.date()!).nearestNextDay(.tuesday).day(), 29)
        XCTAssertEqual(NVDate(fromDate: base.date()!).nearestPreviousDay(.tuesday).day(), 22)
        XCTAssertEqual(NVDate(fromDate: base.date()!).nearestPreviousDay(.wednesday).day(), 16)
        XCTAssertEqual(NVDate(fromDate: base.date()!).nearestPreviousDay(.thursday).day(), 17)
    }

    func testDayAndMonthNameHelpers() {
        let date = NVDate(year: 2018, month: 5, day: 25)

        XCTAssertEqual(date.thisDayName(), .friday)
        XCTAssertEqual(date.todayName(), .friday)
        XCTAssertTrue(date.isThisDayName(.friday))
        XCTAssertTrue(date.isTodayName(.friday))
        XCTAssertFalse(date.isThisDayName(.saturday))

        XCTAssertEqual(date.thisMonthName(), .may)
        XCTAssertTrue(date.isThisMonthName(.may))
        XCTAssertFalse(date.isThisMonthName(.june))
    }

    func testWeekComponentsMatchCurrentCalendar() throws {
        let date = NVDate(year: 2018, month: 2, day: 3)
        let rawDate = try XCTUnwrap(date.date())
        let components = Calendar.current.dateComponents([.weekOfYear, .weekOfMonth], from: rawDate)

        XCTAssertEqual(date.weekOfYear(), components.weekOfYear)
        XCTAssertEqual(date.weekOfMonth(), components.weekOfMonth)
    }
}
