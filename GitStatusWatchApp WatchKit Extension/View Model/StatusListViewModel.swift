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
    
    var apiJSON = [[String : Any]]()
   
     func fetchStatus() {
        APICALL().summaryStatus { (json) in
            self.apiJSON = json! as [[String : Any]]
            for components in self.apiJSON {
                if components["name"] as! String != "Visit www.githubstatus.com for more information" && components["name"] as! String != "" {
                    self.status = GitStatusObject(name: "", status: "")
                    self.status.name = components["name"] as! String
                    self.status.status = components["status"] as! String
                    self.status.status.capitalizeFirstLetter()
                    self.array.append(self.status)
                }
            }
        }
    }

}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
