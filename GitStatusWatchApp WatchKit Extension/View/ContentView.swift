//
//  ContentView.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 9/4/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import SwiftUI
import UIKit
import EMTLoadingIndicator

struct ContentView : View {
    @ObservedObject var statusList = StatusListViewModel()
    @ObservedObject var isConnected = APICALL()
    
    var body: some View {
        ZStack {
            List {
                ForEach(statusList.array) { status in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(self.isConnected.isConnectedtotheInternet ? "No Internet" : status.name ):" )
                                .fontWeight(.heavy)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            Text(status.status)
                        }
                        .padding(20)

                            Circle()
                                .fill(self.statusList.changeColor ?  Color.red : Color.green)
                                .frame(width: 15, height: 15)
                    }
                }
            }
            .listStyle(CarouselListStyle())
            .navigationBarTitle(Text("GitHub Status"))
            .onAppear(perform: {
                self.statusList.fetchStatus()
                print(self.isConnected.isConnectedtotheInternet)

            })
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
