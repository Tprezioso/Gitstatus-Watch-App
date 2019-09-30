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

class StatusListViewModel: ObservedObject {
  
    @Published var status: GitStatusObject = [GitStatusObject]()
    
//    var apiJSON = [[String : Any]]()
    
    
//    private func fetchStatus() {
//        APICALL().summaryStatus { (json) in
//            self.apiJSON = json! as [[String : Any]]
//            for components in self.apiJSON {
//                if components["name"] as! String != "Visit www.githubstatus.com for more information"{
//                    self.status.append(components["name"] as! GitStatusModel)
//
//
//                }
//            }
//        }
//    }

}
