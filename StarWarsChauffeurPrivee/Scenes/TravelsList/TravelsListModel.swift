//
//  TravelsListModel.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 31/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

struct TravelsListModel {
    struct Response {
        var travels: [Travel]
    }
    
    struct ViewModel {
        struct DisplayError {
            var error: String
        }
        
        struct DisplayTravels {
            var travels: [Travel]
        }
    }
}
