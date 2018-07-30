//
//  TripInformation+Serializable.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation
import SwiftyJSON

extension TripInformation: ObjectSerializableProtocol {
    static func object(data: AnyObject) -> TripInformation {
        let json = JSON(data)
        
        let planetName = json[ApiKeys.name].stringValue
        let planetPicture = json[ApiKeys.picture].stringValue
        let date = json[ApiKeys.date].stringValue
        
        return TripInformation(planetName: planetName, planetPicture: planetPicture, date: date)
    }
}
