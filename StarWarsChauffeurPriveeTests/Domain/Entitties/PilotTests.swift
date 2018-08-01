//
//  PilotTests.swift
//  StarWarsChauffeurPriveeTests
//
//  Created by Ilan Benichou on 01/08/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import XCTest

@testable import StarWarsChauffeurPrivee

class PilotTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPilotHasRating() {
        let vador = Pilot(avatar: "vador.jpeg", name: "Vador", rating: 4)
        let skywalker = Pilot(avatar: "skywalker.jpeg", name: "skywalker", rating: 5)
        let pepito = Pilot(avatar: "pepito.jpeg", name: "pepito", rating: 0)
        
        XCTAssertFalse(pepito.hasRating())
        XCTAssertTrue(vador.hasRating())
        XCTAssertTrue(skywalker.hasRating())
    }
}
