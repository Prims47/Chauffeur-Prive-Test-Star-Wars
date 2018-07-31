//
//  AppConfig.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 31/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

enum ServerEnvironementKeys {
    static let env = "server_env"
    static let mock = "mock"
    static let prod = "prod"
}

struct AppConfig {
    static func isMock() -> Bool {
        if let serverEnv = UserDefaults.standard.value(forKey: ServerEnvironementKeys.env) as? String {
            switch serverEnv {
            case ServerEnvironementKeys.mock:
                return true
            default:
                return false
            }
        }
        
        return false
    }
}
