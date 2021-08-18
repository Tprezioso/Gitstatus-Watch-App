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
        List {
            NavigationLink(destination: StatusListView()) {
                Text("Status")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
            }
            NavigationLink(destination: IncidentView()) {
                Text("Last Incident")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
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
