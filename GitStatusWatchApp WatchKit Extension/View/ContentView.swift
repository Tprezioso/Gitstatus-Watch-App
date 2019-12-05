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

//struct WatchLoader: WKInterfaceObjectRepresentable {
//    var indicator: EMTLoadingIndicator
//
//    func makeWKInterfaceObject(context: WKInterfaceObjectRepresentableContext<WatchLoader>) -> EMTLoadingIndicator {
//        return EMTLoadingIndicator.init(interfaceController: self, interfaceImage: image!, width: 40, height: 40, style: .line)
//    }
//
//func updateWKInterfaceObject(_ map: WKInterfaceMap, context: WKInterfaceObjectRepresentableContext<WatchLoader>) {
//    // Update the interface object.
//    let span = MKCoordinateSpan(latitudeDelta: 0.02,
//                                longitudeDelta: 0.02)
//
//    let region = MKCoordinateRegion(
//        center: landmark.locationCoordinate,
//        span: span)
//
//    map.setRegion(region)
//}
    
struct ContentView : View {
    
    @ObservedObject var statusList = StatusListViewModel()
    
    var body: some View {
        ZStack {
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
            
//            Loader(isAnimating: $statusList.loading)
            LoadView(spinCircle: self.$statusList.loading)

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
