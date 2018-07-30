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
    
    mutating func requestCollection<T>(url: String, completion: @escaping ([T], Error?) -> Void) where T : CollectionSerializableProtocol {
        completion([], NSError(domain: "error", code: 400, userInfo: nil))
    }
}
