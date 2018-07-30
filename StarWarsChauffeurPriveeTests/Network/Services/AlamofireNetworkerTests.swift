//
//  AlamofireNetworkerTests.swift
//  StarWarsChauffeurPriveeTests
//
//  Created by Ilan Benichou on 31/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import XCTest

@testable import StarWarsChauffeurPrivee

class AlamofireNetworkerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testUrlNotFound() {
        let alamofireNetwork = AlamofireNetworker(mockingFilename: "pepito")
        
        let requestExpectation = expectation(description: "fetch request expectation")
        
        alamofireNetwork.requestCollection(url: "https://pepitoooooooooo.fr") { (travels: [Travel], error) in
            XCTAssertNotNil(error)
            
            requestExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testIntegrationTravels() {
        let alamofireNetwork = AlamofireNetworker(mockingFilename: "pepito")
        
        let requestExpectation = expectation(description: "fetch request expectation")
        
        alamofireNetwork.requestCollection(url: "https://starwars.chauffeur-prive.com/trips") { (travels: [Travel], error) in
            XCTAssertNil(error)
            XCTAssertEqual(7, travels.count)
            
            requestExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
