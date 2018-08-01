//
//  TripInformation.swift
//  StarWarsChauffeurPrivee
//
//  Created by Ilan Benichou on 30/07/2018.
//  Copyright © 2018 StarWarsChauffeurPrivee. All rights reserved.
//

import Foundation
import SwiftDate

struct TripInformation {
    var planetName: String
    var planetPicture: String
    var date: String
    
    func formatDate() -> String {
//        let dateFormatterGet = DateFormatter()
//        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//
//        let dateFormatterPrint = DateFormatter()
//        dateFormatterPrint.dateFormat = "h:mm a"
//
//        let date: Date? = dateFormatterGet.date(from: "2017-12-09T14:12:10Z")
//        print("Date",dateFormatterPrint.string(from: date!))
        
        
        
        guard let date = Date(self.date) else { return self.date }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        print(dateFormatter.string(for: date))

        return ""
        
//        guard let date = self.date.toDate() else { return self.date }
//
//        return date.toFormat("h:mm a")
    }
}
