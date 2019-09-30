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
        
        ScrollView {
            ForEach(statusList.array) { status in
                Text(status.name)
                Text(status.status)
            }
//               print(statusList as! String)
        }
        .navigationBarTitle(Text("GitHub Status"))
            .onAppear(perform: {
                self.statusList.fetchStatus()
            }) 
    }
    
    
    
    private func fetch() {
        self.api.summaryStatus { (json) in

        }
        
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
