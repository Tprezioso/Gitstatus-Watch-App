//
//  HomeView.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 11/12/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: ContentView()) {
                Text("Status")
            }
            NavigationLink(destination: IncidentView()) {
                Text("Last Incident")
            }
            NavigationLink(destination: UpcomingMaintenancesView()) {
                Text("Schedule Maintenance")
            }
        }
        .navigationBarTitle(Text("GitHub Status"))
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
