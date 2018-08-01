//
//  TripInformationTests.swift
//  StarWarsChauffeurPriveeTests
//
//  Created by Ilan Benichou on 01/08/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import XCTest

@testable import StarWarsChauffeurPrivee

class TripInformationTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFormatDate() {
        let naboo = TripInformation(planetName: "Naboo", planetPicture: "naboo.jpeg", date: "2017-12-09T14:12:51Z")
        let coruscant = TripInformation(planetName: "Coruscant", planetPicture: "coruscant.jped", date: "2017")
        
        XCTAssertEqual("2:12 PM", naboo.formatDate())
        XCTAssertEqual("2017", coruscant.formatDate())
    }
}
