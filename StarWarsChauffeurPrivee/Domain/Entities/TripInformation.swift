//
//  TripInformation.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation
import SwiftDate

struct TripInformation {
    var planetName: String
    var planetPicture: String
    var date: String
    
    func formatDate() -> String {
        guard let date = self.date.toDate() else { return self.date }

        return date.toFormat("h:mm a")
    }
}
