//
//  MaintenanceObject.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 11/21/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import Foundation

struct MaintenanceObject: Identifiable, Decodable {
    let id = UUID()
    var name: String
    var scheduledFor: String
    var status: String
    var body: String

}
