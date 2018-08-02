//
//  StubbedNetworker.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

struct StubbedNetworker: NetworkProtocol {
    var mockingFilename: String?
    
    func requestCollection<T: CollectionSerializableProtocol>(url: String, completion: @escaping CollectionCompletion<T>) {
        guard let file = mockingFilename else {
            let error: NSError = NSError(domain: "CollectionStubbedNetworker", code: 1, userInfo: nil)
            
            completion([], error)
            
            return
        }
        
        guard let jsonObjects = self.getJsonObject(fileName: file) else {
            let error: NSError = NSError(domain: "NoMockFileStubbedNetworker", code: 1, userInfo: nil)
            
            completion([], error)

            return
        }
        
        guard let json = try? JSONSerialization.jsonObject(with: jsonObjects, options: []) else {
            let error: NSError = NSError(domain: "JSONSerializationStubbedNetworker", code: 1, userInfo: nil)
            
            completion([], error)

            return
        }

        DispatchQueue.main.async {
            completion(T.collection(data: json), nil)
        }
    }
    
    func requestObject<T: ObjectSerializableProtocol>(url: String, completion: @escaping ObjectCompletion<T>) {
        guard let file = mockingFilename else {
            let error: NSError = NSError(domain: "CollectionStubbedNetworker", code: 1, userInfo: nil)
            
            completion(nil, error)
            
            return
        }
        
        guard let jsonObjects = self.getJsonObject(fileName: file) else {
            let error: NSError = NSError(domain: "NoMockFileStubbedNetworker", code: 1, userInfo: nil)
            
            completion(nil, error)
            
            return
        }
        
        guard let json = try? JSONSerialization.jsonObject(with: jsonObjects, options: []) else {
            let error: NSError = NSError(domain: "JSONSerializationStubbedNetworker", code: 1, userInfo: nil)
            
            completion(nil, error)
            
            return
        }
        
        DispatchQueue.main.async {
            completion(T.object(data: json as AnyObject), nil)
        }
    }
    
    private func getJsonObject(fileName: String) -> Data? {
        guard let path = Bundle.main.url(forResource: fileName, withExtension: "json") else { return nil }
        let jsonData = try? Data(contentsOf: path)
        
        return jsonData
    }
}
