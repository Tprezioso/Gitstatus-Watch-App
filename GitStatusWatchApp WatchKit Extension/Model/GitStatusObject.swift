//
//  GitStatusModel.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 9/6/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import Foundation

struct GitStatusObject:Identifiable, Decodable {
    var id = UUID()
    var name: String
    var status: String

}
