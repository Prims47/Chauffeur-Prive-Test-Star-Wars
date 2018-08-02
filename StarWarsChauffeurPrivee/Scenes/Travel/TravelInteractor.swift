//
//  TravelInteractor.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 02/08/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

protocol TravelBusinessLogic {
    func fetchTravel(request: TravelModel.Request)
}

class TravelInteractor: TravelBusinessLogic {
    var useCase: TravelUseCaseProtocol
    var presenter: TravelPresentationLogic
    
    init(useCase: TravelUseCaseProtocol, presenter: TravelPresentationLogic) {
        self.useCase = useCase
        self.presenter = presenter
    }

    func fetchTravel(request: TravelModel.Request) {
        self.useCase.travel(travelID: request.travelID) {[weak self] (travel: Travel?, error) in
            if let err = error {
                self?.presenter.presentError()
                
                return
            }
            
            guard let travel = travel else {
                self?.presenter.presentError()

                return
            }
            
            self?.presenter.presentTravel(response: TravelModel.Response(travel: travel))
        }
    }
}
