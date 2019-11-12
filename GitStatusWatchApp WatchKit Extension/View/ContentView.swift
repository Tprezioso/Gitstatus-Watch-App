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
    // TODO: - Work on incedents section within APICall
    // - Also work on changing from list view to Vstack with styling
    // Maybe try Group

    var body: some View {
<<<<<<< HEAD
        //ScrollView mpt working as of right now
        List {
//            VStack(alignment: .leading) {
                ForEach(statusList.array) { status in
                    Button(action: {}){
                        Text("\(status.name): \n\(status.status)")
                            .multilineTextAlignment(.leading)
//                            .lineLimit(nil)
//                            .fixedSize(horizontal: false, vertical: true)
=======
        ScrollView (.vertical) {
            ForEach(statusList.array) { status in
                VStack {
                    Button(action: {}){
                        Text("\(status.name): \n\(status.status)")
//                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
>>>>>>> 5d8d985048280aa89e14ba5276fceac2dab34072
                            .padding(20)
                    
                    }
//                    .disabled(true)
//                }
                    
//                .padding(.bottom)
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
