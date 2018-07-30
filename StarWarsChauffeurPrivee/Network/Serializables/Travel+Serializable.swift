//
//  Travel+Serializables.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation
import SwiftyJSON

extension Travel: ObjectSerializableProtocol {
    static func object(data: AnyObject) -> Travel {
        let json = JSON(data)

        let id = json[ApiKeys.id].intValue
        let pilot = Pilot.object(data: json[ApiKeys.pilot] as AnyObject)
        let duration = json[ApiKeys.duration].intValue
        let pickup = TripInformation.object(data: json[ApiKeys.pickUp] as AnyObject)
        let dropOff = TripInformation.object(data: json[ApiKeys.dropOff] as AnyObject)
        let travelDistance = TravelDistance.object(data: json[ApiKeys.distance] as AnyObject)
        
        return Travel(id: id, pilot: pilot, distance: travelDistance, duration: duration, pickup: pickup, dropOff: dropOff)
    }
}

extension Travel: CollectionSerializableProtocol {
    static func collection(data: Any) -> [Travel] {
        if let jsonValues = data as? [[String: AnyObject]] {
            return jsonValues.map { Travel.object(data: $0 as AnyObject) }
        }
        
        return []
    }
}
