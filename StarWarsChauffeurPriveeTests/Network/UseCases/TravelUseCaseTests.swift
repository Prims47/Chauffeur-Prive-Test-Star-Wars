//
//  TravelUseCaseTests.swift
//  StarWarsChauffeurPriveeTests
//
//  Created by Ilan Benichou on 31/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import XCTest

@testable import StarWarsChauffeurPrivee

class TravelUseCaseTests: XCTestCase {
    var useExpectation: XCTestExpectation?

    override func setUp() {
        super.setUp()
        
        useExpectation = expectation(description: "expectation")
    }
    
    override func tearDown() {
        super.tearDown()
        
        useExpectation = nil
    }
    
    func testSuccessUseCase() {
        var useCase = TravelUseCase(network: Network())
        
        useCase.travels {[weak self] (travels: [Travel], error) in
            XCTAssertNil(error)
            XCTAssertEqual(7, travels.count)
            
            self?.useExpectation?.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testErrorUseCase() {
        var useCase = TravelUseCase(network: NetworkError(mockingFilename: "pepito"))
        
        useCase.travels {[weak self] (travels: [Travel], error) in
            XCTAssertNotNil(error)
            XCTAssertTrue(travels.isEmpty)
            
            self?.useExpectation?.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
