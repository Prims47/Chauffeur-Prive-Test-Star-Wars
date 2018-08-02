//
//  TravelModel.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 02/08/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

struct TravelModel {
    struct Request {
        var travelID: Int
    }
    
    struct Response {
        var travel: Travel
    }
    
    struct ViewModel {
        struct DisplayTravel {
            var travel: Travel
        }
        
        struct DisplayError {
            var error: String
        }
    }
}
