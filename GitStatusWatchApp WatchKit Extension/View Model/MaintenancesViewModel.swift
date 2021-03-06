//
//  MaintenancesViewModel.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 11/21/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class MaintenancesViewModel: ObservableObject {
    var apiJSON = [[String : Any]]()
    @Published var scheduledMaintenance = MaintenanceObject(name: "", scheduledFor: "", status: "", body: "")
    @Published var array = [MaintenanceObject]()
    
    var dateConverter = HelperMethods()
    
    func fetchStatus() {
        APICALL().upcomingMaintenancesStatus { (json) in
            if json!.isEmpty {
                self.scheduledMaintenance.name = "No Scheduled Maintenance"
                self.scheduledMaintenance.scheduledFor = ""
                self.scheduledMaintenance.status = "No Scheduled Maintenance"
                self.scheduledMaintenance.body = "No Details"
            } else {
                self.apiJSON = json! as [[String : Any]]
                self.scheduledMaintenance.name = self.apiJSON[0]["name"] as? String ?? "No Scheduled Maintenance"
                self.scheduledMaintenance.scheduledFor = self.dateConverter.formatDate(date: self.apiJSON[0]["scheduled_for"] as? String ?? "")
                
                self.scheduledMaintenance.status = self.apiJSON[0]["status"] as? String ?? ""
                self.scheduledMaintenance.status.capitalizeFirstLetter()
                if let detailArray = self.apiJSON[0]["incident_updates"] as? [[String:Any]] {
                    self.scheduledMaintenance.body = detailArray[0]["body"] as? String ?? ""
                }
                
                self.array.append(self.scheduledMaintenance)
            }
        }
        
    }
}
