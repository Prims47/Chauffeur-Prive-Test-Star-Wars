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
    var alamofireExpectation: XCTestExpectation?

    override func setUp() {
        super.setUp()
        
        alamofireExpectation = expectation(description: "expectation")
    }
    
    override func tearDown() {
        super.tearDown()
        
        alamofireExpectation = nil
    }
    
    func testUrlNotFound() {
        let alamofireNetwork = AlamofireNetworker(mockingFilename: "pepito")
        
        alamofireNetwork.requestCollection(url: "https://pepitoooooooooo.fr") {[weak self] (travels: [Travel], error) in
            XCTAssertNotNil(error)
            
            self?.alamofireExpectation?.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testIntegrationTravels() {
        let alamofireNetwork = AlamofireNetworker(mockingFilename: "pepito")
        
        alamofireNetwork.requestCollection(url: APIRouter.fetchTravels().asStringURL()) {[weak self] (travels: [Travel], error) in
            XCTAssertNil(error)
            XCTAssertEqual(7, travels.count)
            
            self?.alamofireExpectation?.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
