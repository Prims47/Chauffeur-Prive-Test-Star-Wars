//
//  TravelPresenterTests.swift
//  StarWarsChauffeurPriveeTests
//
//  Created by Ilan Benichou on 02/08/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import XCTest

@testable import StarWarsChauffeurPrivee

class TravelPresenterTests: XCTestCase {
    var presentExpectation: XCTestExpectation?

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        
        presentExpectation = nil
    }
    
    fileprivate class ViewController: TravelDisplayLogic {
        var methodCalledName: String?
        
        weak var presenterTests: TravelPresenterTests?

        func displayTravel(viewModel: TravelModel.ViewModel.DisplayTravel) {
            presenterTests?.presentExpectation?.fulfill()
            methodCalledName = #function
        }
        
        func displayError(viewModel: TravelModel.ViewModel.DisplayError) {
            presenterTests?.presentExpectation?.fulfill()
            methodCalledName = #function
        }
    }
    
    func testDisplayTravel() {
        presentExpectation = expectation(description: "expectation")
        let presenter = TravelPresenter()
        let viewController = ViewController()
        viewController.presenterTests = self
        presenter.viewController = viewController
        
        presenter.presentTravel(response: TravelModel.Response(travel: Travel.object(data: self.getTravelData() as AnyObject)))
        
        waitForExpectations(timeout: 1.0, handler: { _ in
            XCTAssertEqual("displayTravel(viewModel:)", viewController.methodCalledName)
        })
    }
    
    func testDisplayError() {
        presentExpectation = expectation(description: "expectation")
        let presenter = TravelPresenter()
        let viewController = ViewController()
        viewController.presenterTests = self
        presenter.viewController = viewController
        
        presenter.presentError()
        
        waitForExpectations(timeout: 1.0, handler: { _ in
            XCTAssertEqual("displayError(viewModel:)", viewController.methodCalledName)
        })
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
