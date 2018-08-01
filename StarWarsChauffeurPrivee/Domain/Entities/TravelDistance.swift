//
//  TravelDistance.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

struct TravelDistance {
    var value: Int
    var unit: String
    
    func formatDistance() -> String {
        var defaultValue = self.value
        
        if self.value > 10000000 {
            defaultValue = self.value / 10000
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        guard let formatDistance = formatter.string(for: defaultValue) else {
            return "\(defaultValue) \(self.unit.uppercased())"
        }
        
        return "\(formatDistance) \(self.unit.uppercased())"
    }
}
