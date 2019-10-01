//
//  ContentView.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 9/4/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    var api = APICALL()
    var apiJSON = [[String: Any]]()
    
    @ObservedObject var statusList = StatusListViewModel()
    
    var body: some View {
        
        List {
            ForEach(statusList.array) { status in
                VStack {
                    Text(status.name)
                    Text(status.status)
                        .padding()
                }
            .padding()
            }

        }

        .navigationBarTitle(Text("GitHub Status"))
            .onAppear(perform: {
                self.statusList.fetchStatus()
            }) 
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
