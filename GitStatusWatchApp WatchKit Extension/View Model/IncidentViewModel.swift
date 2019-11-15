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
        APICALL().summaryStatus { (json) in
            self.apiJSON = json! as [[String : Any]]
            for response in self.apiJSON {
                self.incident.name = response["name"] as! String
                self.incident.dateCreated = response["created_at"] as! String
                self.incident.impact = response["status"] as! String
//                self.incident.body = response["description"] as! String

                self.array.append(self.incident)
                print(self.array)
            }
        }
    }
    
}

