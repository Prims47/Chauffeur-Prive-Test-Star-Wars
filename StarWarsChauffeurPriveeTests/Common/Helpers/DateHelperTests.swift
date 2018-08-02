//
//  DateHelperTests.swift
//  StarWarsChauffeurPriveeTests
//
//  Created by Ilan Benichou on 02/08/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import XCTest

@testable import StarWarsChauffeurPrivee

class DateHelperTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTimeBetweenDates() {
        let fromNaboo = "2017-12-09T14:12:51Z"
        let toCoruscant = "2017-12-09T19:35:51Z"
        
        let fromCoruscant = "2017-12-09T14:12:51Z"
        let toTatooine = "2017-12-09T19:35:52Z"
        
        let fromHoth = "2017-12-09T14:12:51Z"
        let toYavin = "2017-12-09T19:35:42Z"
        
        XCTAssertEqual("5:23:00", DateHelper.timeBetweenDates(from: fromNaboo, to: toCoruscant))
        XCTAssertEqual("5:23:01", DateHelper.timeBetweenDates(from: fromCoruscant, to: toTatooine))
        XCTAssertEqual("5:22:51", DateHelper.timeBetweenDates(from: fromHoth, to: toYavin))
    }
    
    func testErrorTimeBetweenDates() {
        let fromNaboo = "2017"
        let toCoruscant = "2017-12"
        
        XCTAssertEqual("00:00:00", DateHelper.timeBetweenDates(from: fromNaboo, to: toCoruscant))
    }
    
    func testDateFromString() {
        XCTAssertNotNil(DateHelper.dateFromString(date: "2017-12-09T14:12:51Z"))
    }
    
    func testErrorDateFromString() {
        XCTAssertNil(DateHelper.dateFromString(date: "2017"))
    }
}
