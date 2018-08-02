//
//  APIRouter.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

enum APIRouter {
    case fetchTravels()
    case fetchTravel(Int)
    
    func asStringURL() -> String {
        let path: String = {
            switch self {
            case .fetchTravels():
                return "/trips"
            case .fetchTravel(let tripID):
                return "/trips/\(tripID)"
            }
        }()
        
        let serverUrlString = formatUrlWithCurrentEnv()
        
        return "\(serverUrlString)\(path)"
    }
    
    //@todo: improve this with xcconfig.
    fileprivate func formatUrlWithCurrentEnv() -> String {
        return "https://starwars.chauffeur-prive.com"
    }
}
