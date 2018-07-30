//
//  TravelUseCase.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

protocol TravelUseCase {
    typealias TravelsCompletion = ([Travel], Error?) -> Void
    
    func travels(complation: @escaping TravelsCompletion)
}
