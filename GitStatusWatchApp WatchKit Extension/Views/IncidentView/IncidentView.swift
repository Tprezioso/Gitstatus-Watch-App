//
//  IncidentView.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 11/12/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import SwiftUI

struct IncidentView: View {
    @StateObject var viewModel = IncidentViewModel()
    
    var body: some View {
        List {
            VStack (alignment: .leading, spacing: 4) {
                VStack(spacing: 4) {
                    Text("Last Incident")
                        .font(.title3)
                        .bold()
                    Text(viewModel.incident.dateCreated)
                        .font(.headline)
                    Divider()
                }
                .lineLimit(nil)
                .padding()
                
                Text(viewModel.incident.name)
                    .font(.headline)
                    .bold()
                Spacer()
                HStack {
                    Text("Impact: ")
                        .font(.headline)
                        .bold()
                        +
                        Text(viewModel.incident.impact)
                }
                HStack {
                    Text("Status: ")
                        .font(.headline)
                        .bold()
                        +
                        Text(viewModel.incident.body)
                }
            }
            .padding()
        }
        .onAppear {
            self.viewModel.fetchStatus()
        }
    }
}


struct IncidentView_Previews: PreviewProvider {
    static var previews: some View {
        IncidentView()
    }
}
