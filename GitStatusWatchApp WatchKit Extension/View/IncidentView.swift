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
        ScrollView() {
            VStack (alignment: .leading, spacing: 8) {
                Text("Last Incident")
                    .font(.title)
                Text(incidentList.incident.dateCreated)
                Spacer()
                Text(incidentList.incident.name)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
                HStack {
                    Text("Impact:")
                        .font(.headline)
                    Text(incidentList.incident.impact)
                }
                Text("Status:")
                    .font(.headline)
                Text(incidentList.incident.body)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }
                // this frame layout was used to have same spacing as a button
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .onAppear(perform: {
                    self.incidentList.fetchStatus()
                })
        }
    }
}

struct IncidentView_Previews: PreviewProvider {
    static var previews: some View {
        IncidentView()
    }
}
