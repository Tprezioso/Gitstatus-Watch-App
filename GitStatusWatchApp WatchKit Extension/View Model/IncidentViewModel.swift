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
//            for response in self.apiJSON {
            self.incident.name = self.apiJSON[0]["name"] as! String
                self.incident.dateCreated = self.apiJSON[0]["created_at"] as! String
                self.incident.impact = self.apiJSON[0]["impact"] as? String ?? "No impact"
//            self.incident.body = self.apiJSON[0]["incident_updates"][0]["body"] as! String ?? "No Body"

                self.array.append(self.incident)
                print(self.incident)
//            }
        }
    }
    
}

