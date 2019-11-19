//
//  IncidentView.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 11/12/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import SwiftUI

struct IncidentView: View {
    @ObservedObject var incidentList = IncidentViewModel()

    var body: some View {
        Text(incidentList.incident.name)
            .onAppear(perform: {
                self.incidentList.fetchStatus()
            })
    }
    
}

struct IncidentView_Previews: PreviewProvider {
    static var previews: some View {
        IncidentView()
    }
}
