//
//  DateFormatter.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 11/21/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import Foundation

struct HelperMethods {
    func formatDate(date: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        //    dateFormatter.locale = Locale(identifier: "en_US") //uncomment if you don't want to get the system default format.
        
        let dateObj: Date? = dateFormatterGet.date(from: date)
        
        return dateFormatter.string(from: dateObj!)
    }

}

