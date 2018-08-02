//
//  TripInformation.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation

struct TripInformation {
    var planetName: String
    var planetPicture: String
    var date: String
    
    func formatDate() -> String {
        guard let formatDate = DateHelper.dateFromString(date: self.date) else { return self.date }

        let dateFormatter =  DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.locale = Locale(identifier: "fr_FR")
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        return dateFormatter.string(from: formatDate)
    }
}
