//
//  Travel.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

struct Travel {
    var id: Int
    var pilot: Pilot
    var distance: TravelDistance
    var duration: Int
    var pickup: TripInformation
    var dropOff: TripInformation
}
