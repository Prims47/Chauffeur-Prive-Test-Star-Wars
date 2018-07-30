//
//  StubbedNetworkerTests.swift
//  StarWarsChauffeurPriveeTests
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import XCTest

@testable import StarWarsChauffeurPrivee

class StubbedNetworkerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testErrorNoMockfile() {
        let stubbedNetwork = StubbedNetworker(mockingFilename: nil)
        
        stubbedNetwork.requestCollection(url: "http://Pepitooooooooo.fr") { (travels: [Travel], error) in
            XCTAssertNotNil(error)
            XCTAssertTrue(travels.isEmpty)
        }
    }
    
    func testErrorMockfileDontExist() {
        let stubbedNetwork = StubbedNetworker(mockingFilename: "pepitoLeMock")
        
        stubbedNetwork.requestCollection(url: "http://Pepitooooooooo.fr") { (travels: [Travel], error) in
            XCTAssertNotNil(error)
            XCTAssertTrue(travels.isEmpty)
        }
    }
    
    func testErrorMockfileEmpty() {
        let stubbedNetwork = StubbedNetworker(mockingFilename: "emptyJson")
        
        stubbedNetwork.requestCollection(url: "http://Pepitooooooooo.fr") { (travels: [Travel], error) in
            XCTAssertNotNil(error)
            XCTAssertTrue(travels.isEmpty)
        }
    }
    
    func testSuccessCollection() {
        let stubbedNetwork = StubbedNetworker(mockingFilename: "travels")
        
        stubbedNetwork.requestCollection(url: "http://Pepitooooooooo.fr") { (travels: [Travel], error) in
            XCTAssertEqual(7, travels.count)
            XCTAssertNil(error)
        }
    }
}
