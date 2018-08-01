//
//  Date.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 02/08/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

struct DateHelper {
    static func timeBetweenDates(from: String, to: String) -> String {
        guard let dateFrom = Date(from), let dateTo = Date(to) else {
            return "00:00:00"
        }

        let interval = Calendar.current.dateComponents([.hour, .minute, .second], from: dateFrom, to: dateTo)

        guard let hour = interval.hour, let minute = interval.minute, let second = interval.second else {
            return "00:00:00"
        }
        
        var secondString = "\(second)"

        if second < 10 {
            secondString = "0\(second)"
        }

        return "\(hour):\(minute):\(secondString)"
    }
    
}
