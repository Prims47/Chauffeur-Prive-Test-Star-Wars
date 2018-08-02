//
//  NetworkError.swift
//  StarWarsChauffeurPriveeTests
//
//  Created by Ilan Benichou on 31/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

@testable import StarWarsChauffeurPrivee

struct NetworkError: NetworkProtocol {
    var mockingFilename: String?
    
    mutating func requestCollection<T: CollectionSerializableProtocol>(url: String, completion: @escaping CollectionCompletion<T>) {
        completion([], NSError(domain: "error", code: 400, userInfo: nil))
    }
    
    mutating func requestObject<T: ObjectSerializableProtocol>(url: String, completion: @escaping ObjectCompletion<T>) {
        completion(nil, NSError(domain: "error", code: 400, userInfo: nil))
    }
}
