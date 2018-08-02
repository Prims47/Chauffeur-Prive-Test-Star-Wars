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
    
    func testSuccessTravelsUseCase() {
        var useCase = TravelUseCase(network: Network())
        
        useCase.travels {[weak self] (travels: [Travel], error) in
            XCTAssertNil(error)
            XCTAssertEqual(7, travels.count)
            
            self?.useExpectation?.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testErrorTravelsUseCase() {
        var useCase = TravelUseCase(network: NetworkError(mockingFilename: "pepito"))
        
        useCase.travels {[weak self] (travels: [Travel], error) in
            XCTAssertNotNil(error)
            XCTAssertTrue(travels.isEmpty)
            
            self?.useExpectation?.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testSuccessTravelUseCase() {
        var useCase = TravelUseCase(network: Network())
        
        useCase.travel(travelID: 1) {[weak self] (travel: Travel?, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(travel)
            
            self?.useExpectation?.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testErrorTravelUseCase() {
        var useCase = TravelUseCase(network: NetworkError(mockingFilename: "pepito"))
        
        useCase.travel(travelID: 770) {[weak self] (travel: Travel?, error) in
            XCTAssertNotNil(error)
            XCTAssertNil(travel)
            
            self?.useExpectation?.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
