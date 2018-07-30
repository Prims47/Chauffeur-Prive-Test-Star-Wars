//
//  Travel+SerializableTests.swift
//  StarWarsChauffeurPriveeTests
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import XCTest

@testable import StarWarsChauffeurPrivee

class TravelSerializableTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testObjectSerializable() {
        let travel = Travel.object(data: self.getData() as AnyObject)
        
        XCTAssertEqual(770, travel.id)
        XCTAssertEqual("Dark Vador", travel.pilot.name)
        XCTAssertEqual(770, travel.distance.value)
        XCTAssertEqual(47, travel.duration)
        XCTAssertEqual("2017-12-09T19:35:51Z", travel.pickup.date)
        XCTAssertEqual("2017-13-09T19:35:51Z", travel.dropOff.date)
    }
    
    func testCollectionSerializable() {
        let datas = [self.getData(), self.getData(), self.getData(), self.getData()]
        
        let travels = Travel.collection(data: datas)

        XCTAssertEqual(4, travels.count)
        
        XCTAssertEqual(770, travels.first?.id)
        XCTAssertEqual("Dark Vador", travels.first?.pilot.name)
        XCTAssertEqual(770, travels.first?.distance.value)
        XCTAssertEqual(47, travels.first?.duration)
        XCTAssertEqual("2017-12-09T19:35:51Z", travels.first?.pickup.date)
        XCTAssertEqual("2017-13-09T19:35:51Z", travels.first?.dropOff.date)
    }
    
    func testEmptyCollectionSerializable() {
        let datas = ["name": "Pepito"]
        
        let travels = Travel.collection(data: datas)
        
        XCTAssertEqual(0, travels.count)
    }
    
    fileprivate func getData() -> [String: Any] {
        return [
            "id": 770,
            "pilot": ["name": "Dark Vador", "avatar": "vador", "rating": 5],
            "distance": ["value": 770, "unit": "km"],
            "duration": 47,
            "pick_up": ["name": "Yavin", "picture": "yavin", "date": "2017-12-09T19:35:51Z"],
            "drop_off": ["name": "Naboo", "picture": "naboo", "date": "2017-13-09T19:35:51Z"]
        ] as [String: Any]
    }
}
