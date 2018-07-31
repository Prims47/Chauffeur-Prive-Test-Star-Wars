//
//  TripListPresenter.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 31/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

protocol TravelsListPresentationLogic {
    func presentTravels(response: TravelsListModel.Response)
    func presentError()
}

class TravelsListPresenter: TravelsListPresentationLogic {
    weak var viewController: TravelsListDisplayLogic?
    
    func presentTravels(response: TravelsListModel.Response) {
        DispatchQueue.main.async {
            self.viewController?.displayTravels(viewModel: TravelsListModel.ViewModel(travels: response.travels))
        }
    }
    
    func presentError() {
        DispatchQueue.main.async {
            //@todo: use localizable
            self.viewController?.displayError(viewModel: TravelsListModel.ViewModel.DisplayError(error: "Error de chargement du serveur"))
        }
    }
}
