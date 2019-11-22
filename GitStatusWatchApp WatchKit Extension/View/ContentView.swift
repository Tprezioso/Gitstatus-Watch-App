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
                VStack(alignment: .leading) {
                    Text("\(status.name):")
                        .fontWeight(.heavy)
                            .multilineTextAlignment(.leading)
                            
                    Spacer()
                    Text(status.status)
                }
                .padding(20)
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
