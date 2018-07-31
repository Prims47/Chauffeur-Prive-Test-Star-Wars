//
//  AppConfigTests.swift
//  StarWarsChauffeurPriveeTests
//
//  Created by Ilan Benichou on 31/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import XCTest

@testable import StarWarsChauffeurPrivee

class AppConfigTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        
        UserDefaults.standard.removeObject(forKey: ServerEnvironementKeys.env)
    }
    
    func testEnvIsMock() {
        UserDefaults.standard.set(ServerEnvironementKeys.mock, forKey: ServerEnvironementKeys.env)
        
        XCTAssertTrue(AppConfig.isMock())
    }
    
    func testEnvIsNotMock() {
        UserDefaults.standard.set(ServerEnvironementKeys.prod, forKey: ServerEnvironementKeys.env)
        
        XCTAssertFalse(AppConfig.isMock())
    }
    
    func testEnvDefaultIsNotMock() {
        XCTAssertFalse(AppConfig.isMock())
    }
}
