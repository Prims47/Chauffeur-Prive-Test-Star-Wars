//
//  TravelsListInteractorTests.swift
//  StarWarsChauffeurPriveeTests
//
//  Created by Ilan Benichou on 31/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import XCTest

@testable import StarWarsChauffeurPrivee

class TravelsListInteractorTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    fileprivate class TravelListPresentationSuccess: TravelsListPresentationLogic {
        var methodCalledName: String?

        func presentTravels(response: TravelsListModel.Response) {
            methodCalledName = #function
        }
        
        func presentError() {
            methodCalledName = #function
        }
    }
    
    func testPresentTravels() {
        let presenter = TravelListPresentationSuccess()
        let interactor = TravelsListInteractor(useCase: TravelUseCaseSuccessTest(), presenter: presenter)
        
        interactor.fetchTravels()
        
        XCTAssertEqual("presentTravels(response:)", presenter.methodCalledName)
    }
    
    func testPresentError() {
        let presenter = TravelListPresentationSuccess()
        let interactor = TravelsListInteractor(useCase: TravelUseCaseErrorTest(), presenter: presenter)
        
        interactor.fetchTravels()
        
        XCTAssertEqual("presentError()", presenter.methodCalledName)
    }
}
