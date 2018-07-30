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
    
    func asStringURL() -> String {
        let path: String = {
            switch self {
            case .fetchTravels():
                return "/trips"
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
