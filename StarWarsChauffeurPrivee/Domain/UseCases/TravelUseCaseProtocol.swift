//
//  TravelUseCase.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

protocol TravelUseCaseProtocol {
    typealias TravelsCompletion = ([Travel], Error?) -> Void
    typealias TravelCompletion = (Travel?, Error?) -> Void
    
    mutating func travels(completion: @escaping TravelsCompletion)
    mutating func travel(travelID: Int, completion: @escaping TravelCompletion)
}
