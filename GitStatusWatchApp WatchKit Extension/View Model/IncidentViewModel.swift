//
//  IncidentViewModel.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 11/14/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class IncidentViewModel: ObservableObject {
    
    @Published var incident = GitIncidentsObject(name: "", dateCreated: "", impact: "", body: "")
    @Published var array = [GitIncidentsObject]()
    
    var apiJSON = [[String : Any]]()
    
    func fetchStatus() {
        APICALL().lastIncident { (json) in
            self.apiJSON = json! as [[String : Any]]
            self.incident.name = self.apiJSON[0]["name"] as! String
            self.incident.dateCreated = self.formatDate(date: self.apiJSON[0]["created_at"] as! String)
            
            self.incident.impact = self.apiJSON[0]["impact"] as? String ?? "No impact"
            self.incident.impact.capitalizeFirstLetter()
            if let detailArray = self.apiJSON[0]["incident_updates"] as? [[String:Any]] {
                self.incident.body = detailArray[0]["body"] as! String
                print(detailArray[0]["body"]!)
            }
            
            self.array.append(self.incident)
        }
    }
    
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
