//
//  UpcomingMaintenancesView.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 11/21/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import SwiftUI

struct UpcomingMaintenancesView: View {
    @State var noMaintenance = false
    var body: some View {
        ScrollView {
            MaintenaceView()
        }
    }

}

struct UpcomingMaintenancesView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingMaintenancesView()
    }
}

struct MaintenaceView: View {
    @ObservedObject var maintenance = MaintenancesViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Maintenance")
                .font(.system(size: 25))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text(maintenance.scheduledMaintenance.name)
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            Text(maintenance.scheduledMaintenance.scheduledFor)
            Spacer()
            Text("Status:")
                .font(.headline)
            Text(maintenance.scheduledMaintenance.status)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Detail:")
            Text(maintenance.scheduledMaintenance.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding()
            
        .onAppear(perform: {
            self.maintenance.fetchStatus()
        })
    }
}
