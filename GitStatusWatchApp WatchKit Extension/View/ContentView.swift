//
//  ContentView.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 9/4/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @ObservedObject var statusList = StatusListViewModel()
    
    var body: some View {
        List {
            ForEach(statusList.array) { status in
                VStack(alignment: .leading, spacing: 1) {
                    Text("\(status.name):")
                        .multilineTextAlignment(.leading)

                    Text(status.status)
                        .multilineTextAlignment(.leading)
                        .padding(.top)
                    
                    }
                .padding()
            }
        }
        .listStyle(CarouselListStyle())
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
