//
//  Travel.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

struct Travel {
    var id: String
    var pilot: Pilot
    var duration: Int
    var pickup: TripInformation
    var dropOff: TripInformation
}
