//
//  AlamofireNetworker.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation
import Alamofire

struct AlamofireNetworker: NetworkProtocol {
    var mockingFilename: String?
    
    func requestCollection<T: CollectionSerializableProtocol>(url: String, completion: @escaping CollectionCompletion<T>) {
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result {
            case .success(_):
                guard let data = response.data else {
                    let error: NSError = NSError(domain: "CollectionAlamofireDataNetworker", code: 1, userInfo: nil)
                    completion([], error)
                    
                    return
                }
                
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                
                completion(T.collection(data: json), nil)
            case .failure(let error):
                completion([], error)
            }
        }
    }
    
    func requestObject<T: ObjectSerializableProtocol>(url: String, completion: @escaping ObjectCompletion<T>) {
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result {
            case .success(_):
                guard let data = response.data else {
                    let error: NSError = NSError(domain: "CollectionAlamofireDataNetworker", code: 1, userInfo: nil)
                    completion(nil, error)
                    
                    return
                }
                
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                
                completion(T.object(data: json as AnyObject), nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
