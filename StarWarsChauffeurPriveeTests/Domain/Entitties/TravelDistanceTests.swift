//
//  TravelDistanceTests.swift
//  StarWarsChauffeurPriveeTests
//
//  Created by Ilan Benichou on 01/08/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import XCTest

@testable import StarWarsChauffeurPrivee

class TravelDistanceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDistanceFormat() {
        let distanceNaboo = TravelDistance(value: 24785727853, unit: "km")
        let distanceCoruscant = TravelDistance(value: 2478572, unit: "km")
        
        XCTAssertEqual("2,478,572 KM", distanceNaboo.formatDistance())
        XCTAssertEqual("2,478,572 KM", distanceCoruscant.formatDistance())
    }
}
