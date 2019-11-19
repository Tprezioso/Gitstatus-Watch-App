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
        VStack (alignment: .leading) {
            Text("Last Incident")
                .font(.headline)
            Text(incidentList.incident.dateCreated)
            Spacer()
            Text(incidentList.incident.name)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
            HStack {
                Text("Impact:")
                Text(incidentList.incident.impact)
            }
//            Text(incidentList.incident.body)
        }
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
