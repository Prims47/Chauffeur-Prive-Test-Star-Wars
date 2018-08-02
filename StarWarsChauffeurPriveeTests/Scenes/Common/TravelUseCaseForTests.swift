//
//  TravelUseCaseTests.swift
//  StarWarsChauffeurPriveeTests
//
//  Created by Ilan Benichou on 02/08/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

@testable import StarWarsChauffeurPrivee

struct TravelUseCaseSuccessTest: TravelUseCaseProtocol {
    mutating func travel(travelID: Int, completion: @escaping TravelUseCaseProtocol.TravelCompletion) {
        completion(Travel.object(data: self.getTravelData() as AnyObject), nil)
    }
    
    mutating func travels(completion: @escaping TravelUseCaseProtocol.TravelsCompletion) {
        completion([Travel.object(data: self.getTravelData() as AnyObject)], nil)
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

struct TravelUseCaseErrorTest: TravelUseCaseProtocol {
    mutating func travel(travelID: Int, completion: @escaping TravelUseCaseProtocol.TravelCompletion) {
        completion(nil, NSError(domain: "Error", code: 1, userInfo: nil))
    }
    
    mutating func travels(completion: @escaping TravelUseCaseProtocol.TravelsCompletion) {
        completion([], NSError(domain: "Error", code: 1, userInfo: nil))
    }
}
