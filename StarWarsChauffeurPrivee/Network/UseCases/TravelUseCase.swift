//
//  TravelUseCase.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

struct TravelUseCase: TravelUseCaseProtocol {
    var network: NetworkProtocol
    
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    mutating func travels(completion: @escaping TravelUseCaseProtocol.TravelsCompletion) {
        self.network.mockingFilename = "travels"
        self.network.requestCollection(url: APIRouter.fetchTravels().asStringURL()) { (travels: [Travel], error) in
            if let err = error {
                completion([], err)
                
                return
            }
            
            completion(travels, nil)
        }
    }
    
    mutating func travel(travelID: Int, completion: @escaping TravelUseCaseProtocol.TravelCompletion) {
        self.network.mockingFilename = "travel"
        self.network.requestObject(url: APIRouter.fetchTravel(travelID).asStringURL()) { (travel: Travel?, error) in
            if let err = error {
                completion(nil, err)
                
                return
            }
            
            completion(travel, nil)
        }
    }
}
