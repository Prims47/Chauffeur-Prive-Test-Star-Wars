//
//  TravelDistance+SerializableTests.swift
//  StarWarsChauffeurPriveeTests
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import XCTest

@testable import StarWarsChauffeurPrivee

class TravelDistanceSerializableTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testObjectSerializable() {
        let data = ["value": 770, "unit": "km"] as [String: Any]
        
        let distance = TravelDistance.object(data: data as AnyObject)
        
        XCTAssertEqual(770, distance.value)
        XCTAssertEqual("km", distance.unit)
    }
}
