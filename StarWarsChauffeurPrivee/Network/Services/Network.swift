//
//  Network.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

protocol NetworkProtocol {
    typealias CollectionCompletion<T> = ([T], Error?) -> Void
    
    var mockingFilename: String? { get set }
    
    mutating func requestCollection<T: CollectionSerializableProtocol>(url: String, completion: @escaping CollectionCompletion<T>)
}

struct Network: NetworkProtocol {
    var mockingFilename: String?
    
    private var networker: NetworkProtocol

    init() {
        if AppConfig.isMock() {
            self.networker = StubbedNetworker()
            
            return
        }

        self.networker = AlamofireNetworker()
    }
    
    mutating func requestCollection<T: CollectionSerializableProtocol>(url: String, completion: @escaping CollectionCompletion<T>) {
        self.networker.mockingFilename = self.mockingFilename
        self.networker.requestCollection(url: url, completion: completion)
    }
}
