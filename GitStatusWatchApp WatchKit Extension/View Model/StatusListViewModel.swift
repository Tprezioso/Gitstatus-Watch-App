//
//  StatusListViewModel.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 9/26/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class StatusListViewModel: ObservableObject {
    
    @Published var status = GitStatusObject(name: "", status: "")
    @Published var array = [GitStatusObject]()
    @Published var changeColor = false
    @ObservedObject var isConnected = APICALL()
    var apiJSON = [[String : Any]]()
    
    func fetchStatus() {
        self.array = [GitStatusObject]()
        APICALL().summaryStatus { (json) in
            self.apiJSON = json! as [[String : Any]]
            for components in self.apiJSON {
                if components["name"] as! String != "Visit www.githubstatus.com for more information" && components["name"] as! String != "" {
                    self.status = GitStatusObject(name: "", status: "")
                    self.status.name = components["name"] as? String ?? "No Internet"
                    self.status.status = components["status"] as! String
                    if self.status.status != "operational" {
                        self.changeColor = true
                    }
                    self.status.status.capitalizeFirstLetter()
                    self.array.append(self.status)
                }
            }
        }
    }
    
}

