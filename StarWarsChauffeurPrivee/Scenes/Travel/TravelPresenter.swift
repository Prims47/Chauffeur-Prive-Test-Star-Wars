//
//  TravelPresenter.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 02/08/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

protocol TravelPresentationLogic {
    func presentTravel(response: TravelModel.Response)
    func presentError()
}

class TravelPresenter: TravelPresentationLogic {
    weak var viewController: TravelDisplayLogic?

    func presentTravel(response: TravelModel.Response) {
        DispatchQueue.main.async {
            self.viewController?.displayTravel(viewModel: TravelModel.ViewModel.DisplayTravel(travel: response.travel))
        }
    }

    func presentError() {
        DispatchQueue.main.async {
            //@todo: use localizable
            self.viewController?.displayError(viewModel: TravelModel.ViewModel.DisplayError(error: "Error de chargement du serveur"))
        }
    }
}
