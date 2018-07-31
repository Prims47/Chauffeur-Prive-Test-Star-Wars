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
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSuccessUseCase() {
        var useCase = TravelUseCase(network: Network())
        
        useCase.travels { (travels: [Travel], error) in
            XCTAssertNil(error)
            XCTAssertEqual(7, travels.count)
        }
    }
    
    func testErrorUseCase() {
        var useCase = TravelUseCase(network: NetworkError(mockingFilename: "pepito"))
        
        useCase.travels { (travels: [Travel], error) in
            XCTAssertNotNil(error)
            XCTAssertTrue(travels.isEmpty)
        }
    }
}
