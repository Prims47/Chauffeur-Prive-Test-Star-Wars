//
//  TravelDistance+Serializable.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation
import SwiftyJSON

extension TravelDistance: ObjectSerializableProtocol {
    static func object(data: AnyObject) -> TravelDistance {
        let json = JSON(data)

        return TravelDistance(value: json[ApiKeys.value].intValue, unit: json[ApiKeys.unit].stringValue)
    }
}
