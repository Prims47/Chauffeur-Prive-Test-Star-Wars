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
    
    fileprivate struct TravelUseCaseSuccessTest: TravelUseCaseProtocol {
        mutating func travels(completion: @escaping TravelUseCaseProtocol.TravelsCompletion) {
            completion([Travel.object(data: self.getTravelData() as AnyObject)], nil)
        }
        
        fileprivate func getTravelData() -> [String: Any] {
            return [
                "id": 770,
                "pilot": ["name": "Dark Vador", "avatar": "vador", "rating": 5],
                "distance": ["value": 770, "unit": "km"],
                "duration": 47,
                "pick_up": ["name": "Yavin", "picture": "yavin", "date": "2017-12-09T19:35:51Z"],
                "drop_off": ["name": "Naboo", "picture": "naboo", "date": "2017-13-09T19:35:51Z"]
                ] as [String: Any]
        }
    }
    
    fileprivate struct TravelUseCaseErrorTest: TravelUseCaseProtocol {
        mutating func travels(completion: @escaping TravelUseCaseProtocol.TravelsCompletion) {
            completion([], NSError(domain: "Error", code: 1, userInfo: nil))
        }
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
