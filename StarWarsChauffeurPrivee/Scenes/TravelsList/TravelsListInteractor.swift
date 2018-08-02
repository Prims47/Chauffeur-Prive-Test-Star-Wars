//
//  TripListInteractor.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 31/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

protocol TravelsListBusinessLogic {
    func fetchTravels()
}

protocol TravelsListDataStore {
    var travelID: Int? { get set }
}

class TravelsListInteractor: TravelsListBusinessLogic, TravelsListDataStore {
    var travelID: Int?
    var useCase: TravelUseCaseProtocol
    var presenter: TravelsListPresentationLogic
    
    init(useCase: TravelUseCaseProtocol, presenter: TravelsListPresentationLogic) {
        self.useCase = useCase
        self.presenter = presenter
    }
    
    func fetchTravels() {
        self.useCase.travels {[weak self] (travels: [Travel], error) in
            if let err = error {
                self?.presenter.presentError()

                return
            }

            self?.presenter.presentTravels(response: TravelsListModel.Response(travels: travels))
        }
    }
}
