//
//  Pilot+Serializable.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation
import SwiftyJSON

extension Pilot: ObjectSerializableProtocol {
    static func object(data: AnyObject) -> Pilot {
        let json = JSON(data)
        
        let name = json[ApiKeys.name].stringValue
        let avatar = json[ApiKeys.avatar].stringValue
        let rating = json[ApiKeys.rating].intValue
        
        return Pilot(avatar: avatar, name: name, rating: rating)
    }
}
