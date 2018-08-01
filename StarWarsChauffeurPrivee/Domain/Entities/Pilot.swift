//
//  Toto.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

struct Pilot {
    var avatar: String
    var name: String
    var rating: Int
    
    func hasRating() -> Bool {
        return self.rating > 0
    }
}
