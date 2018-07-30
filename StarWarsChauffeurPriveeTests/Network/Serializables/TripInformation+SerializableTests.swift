//
//  TripInformation+SerializableTests.swift
//  StarWarsChauffeurPriveeTests
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import XCTest

@testable import StarWarsChauffeurPrivee

class TripInformationSerializableTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testObjectSerializable() {
        let data = ["name": "Pepito", "picture": "lecolasson.jpeg", "date": "2017-12-09T19:35:51Z"]
        
        let trip = TripInformation.object(data: data as AnyObject)
        
        XCTAssertEqual("Pepito", trip.planetName)
        XCTAssertEqual("lecolasson.jpeg", trip.planetPicture)
        XCTAssertEqual("2017-12-09T19:35:51Z", trip.date)
    }
}
