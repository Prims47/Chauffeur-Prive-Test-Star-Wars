//
//  TravelInteractorTests.swift
//  StarWarsChauffeurPriveeTests
//
//  Created by Ilan Benichou on 02/08/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import XCTest

@testable import StarWarsChauffeurPrivee

class TravelInteractorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    fileprivate struct TravelUseCaseTravelNilTest: TravelUseCaseProtocol {
        mutating func travel(travelID: Int, completion: @escaping TravelUseCaseProtocol.TravelCompletion) {
            completion(nil, nil)
        }
        
        mutating func travels(completion: @escaping TravelUseCaseProtocol.TravelsCompletion) {
            completion([], NSError(domain: "Error", code: 1, userInfo: nil))
        }
    }
    
    fileprivate class TravelPresentationSuccess: TravelPresentationLogic {
        var methodCalledName: String?
        
        func presentTravel(response: TravelModel.Response) {
            methodCalledName = #function
        }

        func presentError() {
            methodCalledName = #function
        }
    }
    
    func testPresentTravels() {
        let presenter = TravelPresentationSuccess()
        let interactor = TravelInteractor(useCase: TravelUseCaseSuccessTest(), presenter: presenter)
        
        interactor.fetchTravel(request: TravelModel.Request(travelID: 1))
        
        XCTAssertEqual("presentTravel(response:)", presenter.methodCalledName)
    }
    
    func testPresentError() {
        let presenter = TravelPresentationSuccess()
        let interactor = TravelInteractor(useCase: TravelUseCaseErrorTest(), presenter: presenter)
        
        interactor.fetchTravel(request: TravelModel.Request(travelID: 1))
        
        XCTAssertEqual("presentError()", presenter.methodCalledName)
    }
    
    func testPresentErrorWhenTravelIsNil() {
        let presenter = TravelPresentationSuccess()
        let interactor = TravelInteractor(useCase: TravelUseCaseTravelNilTest(), presenter: presenter)
        
        interactor.fetchTravel(request: TravelModel.Request(travelID: 1))
        
        XCTAssertEqual("presentError()", presenter.methodCalledName)
    }
}
