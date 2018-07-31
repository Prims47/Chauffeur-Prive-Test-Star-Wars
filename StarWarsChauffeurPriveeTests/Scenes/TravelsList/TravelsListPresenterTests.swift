//
//  TravelsListPresenterTests.swift
//  StarWarsChauffeurPriveeTests
//
//  Created by Ilan Benichou on 31/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import XCTest

@testable import StarWarsChauffeurPrivee

class TravelsListPresenterTests: XCTestCase {
    var presentExpectation: XCTestExpectation?

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        
        presentExpectation = nil
    }
    
    fileprivate class ViewController: TravelsListDisplayLogic {
        var methodCalledName: String?

        weak var presenterTests: TravelsListPresenterTests?

        func displayTravels(viewModel: TravelsListModel.ViewModel) {
            presenterTests?.presentExpectation?.fulfill()
            methodCalledName = #function
        }
        
        func displayError(viewModel: TravelsListModel.ViewModel.DisplayError) {
            presenterTests?.presentExpectation?.fulfill()
            methodCalledName = #function
        }
    }
    
    func testDisplayTravels() {
        presentExpectation = expectation(description: "expectation")
        let presenter = TravelsListPresenter()
        let viewController = ViewController()
        viewController.presenterTests = self
        presenter.viewController = viewController
        
        presenter.presentTravels(response: TravelsListModel.Response(travels: []))

        waitForExpectations(timeout: 1.0, handler: { _ in
            XCTAssertEqual("displayTravels(viewModel:)", viewController.methodCalledName)
        })
    }
    
    func testDisplayError() {
        presentExpectation = expectation(description: "expectation")
        let presenter = TravelsListPresenter()
        let viewController = ViewController()
        viewController.presenterTests = self
        presenter.viewController = viewController
        
        presenter.presentError()
        
        waitForExpectations(timeout: 1.0, handler: { _ in
            XCTAssertEqual("displayError(viewModel:)", viewController.methodCalledName)
        })
    }
}
