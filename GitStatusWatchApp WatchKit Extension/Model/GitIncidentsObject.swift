//
//  GitIncidentsObject.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 11/14/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import Foundation

struct GitIncidentsObject: Identifiable, Decodable {
    let id = UUID()
    var name: String
    var dateCreated: String
    var impact: String
    var body: String

}
