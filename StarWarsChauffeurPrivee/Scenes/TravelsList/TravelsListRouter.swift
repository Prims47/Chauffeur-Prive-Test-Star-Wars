//
//  TravelsListRouter.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 01/08/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import UIKit

protocol TravelsListRoutingLogic {
    func detailTravel()
}

protocol TravelsListDataPassing {
    var dataStore: TravelsListDataStore? { get }
}

class TravelsListRouter: TravelsListRoutingLogic, TravelsListDataPassing {
    var dataStore: TravelsListDataStore?
    weak var viewController: UIViewController?
    
    func detailTravel() {
        guard let travel = dataStore?.travel else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let viewController = storyboard.instantiateViewController(withIdentifier: "TravelViewController") as? TravelViewController {
            viewController.travel = travel
            self.viewController?.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
