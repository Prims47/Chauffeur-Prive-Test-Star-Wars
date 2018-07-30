//
//  Pilot+SerializableTests.swift
//  StarWarsChauffeurPriveeTests
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import XCTest

@testable import StarWarsChauffeurPrivee

class PilotSerializableTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testObjectSerializable() {
        let data = ["name": "Pepito", "avatar": "lecolasonn.jpeg", "rating": 4] as [String: Any]
        
        let pilot = Pilot.object(data: data as AnyObject)
        
        XCTAssertEqual("Pepito", pilot.name)
        XCTAssertEqual("lecolasonn.jpeg", pilot.avatar)
        XCTAssertEqual(4, pilot.rating)
    }
}
