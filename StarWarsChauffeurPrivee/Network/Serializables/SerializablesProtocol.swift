//
//  SerializablesProtocol.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

protocol ObjectSerializableProtocol {
    static func object(data: AnyObject) -> Self
}

protocol CollectionSerializableProtocol {
    static func collection(data: Any) -> [Self]
}
