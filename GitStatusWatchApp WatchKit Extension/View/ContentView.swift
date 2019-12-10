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
    
    var body: some View {
        ZStack {
            List {
                ForEach(statusList.array) { status in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(status.name):" )
                                .fontWeight(.heavy)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            Text(status.status)
                        }
                        .padding(20)
                        if status.name != "No Internet" {
                            Circle()
                             .fill(self.statusList.changeColor ?  Color.red : Color.green)
                            .frame(width: 15, height: 15)

                        }
                    }

                }

            }


            .listStyle(CarouselListStyle())
            .navigationBarTitle(Text("GitHub Status"))
            .onAppear(perform: {
                self.statusList.fetchStatus()
            })
//     TODO: - Look into seeing if you can use a activity indicator
//            Loader(isAnimating: $statusList.loading)
//            LoadView(spinCircle: self.$statusList.loading)
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
