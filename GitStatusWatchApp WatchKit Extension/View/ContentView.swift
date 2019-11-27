//
//  ContentView.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 9/4/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView : View {
    
    @ObservedObject var statusList = StatusListViewModel()
    
    @State var spinCircle = true
    @State var hideLoading = false
    
    var body: some View {
//        ZStack {
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
                self.spinCircle.toggle()

            })

//            Circle()
//                .trim(from: 0.5, to: 1)
//                .stroke(Color.blue, lineWidth:4)
//                .frame(width:100)
//                .rotationEffect(.degrees(spinCircle ? 0 : -360), anchor: .center)
//                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
//                .onAppear(perform: {
//                    self.statusList.fetchStatus()
//                    self.spinCircle.toggle()
//
//                })
//        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
