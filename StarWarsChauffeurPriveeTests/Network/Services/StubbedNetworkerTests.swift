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
    
    func testErrorCollectionNoMockfile() {
        let stubbedNetwork = StubbedNetworker(mockingFilename: nil)
        
        stubbedNetwork.requestCollection(url: "http://Pepitooooooooo.fr") { (travels: [Travel], error) in
            XCTAssertNotNil(error)
            XCTAssertTrue(travels.isEmpty)
        }
    }
    
    func testErrorCollectionMockfileDontExist() {
        let stubbedNetwork = StubbedNetworker(mockingFilename: "pepitoLeMock")
        
        stubbedNetwork.requestCollection(url: "http://Pepitooooooooo.fr") { (travels: [Travel], error) in
            XCTAssertNotNil(error)
            XCTAssertTrue(travels.isEmpty)
        }
    }
    
    func testErrorCollectionMockfileEmpty() {
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
    
    func testErrorObjectNoMockfile() {
        let stubbedNetwork = StubbedNetworker(mockingFilename: nil)
        
        stubbedNetwork.requestObject(url: "http://Pepitooooooooo.fr") { (travel: Travel?, error) in
            XCTAssertNotNil(error)
            XCTAssertNil(travel)
        }
    }
    
    func testErrorObjectMockfileDontExist() {
        let stubbedNetwork = StubbedNetworker(mockingFilename: "pepitoLeMock")
        
        stubbedNetwork.requestObject(url: "http://Pepitooooooooo.fr") { (travel: Travel?, error) in
            XCTAssertNotNil(error)
            XCTAssertNil(travel)
        }
    }
    
    func testErrorObjectMockfileEmpty() {
        let stubbedNetwork = StubbedNetworker(mockingFilename: "emptyJson")
        
        stubbedNetwork.requestObject(url: "http://Pepitooooooooo.fr") { (travel: Travel?, error) in
            XCTAssertNotNil(error)
            XCTAssertNil(travel)
        }
    }
    
    func testSuccessObject() {
        let stubbedNetwork = StubbedNetworker(mockingFilename: "travel")
        
        stubbedNetwork.requestObject(url: "http://Pepitooooooooo.fr") { (travel: Travel?, error) in
            XCTAssertNotNil(travel)
            XCTAssertNil(error)
        }
    }
}
