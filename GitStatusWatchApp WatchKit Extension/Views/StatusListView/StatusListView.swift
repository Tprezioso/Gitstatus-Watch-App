//
//  ContentView.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 9/4/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import SwiftUI
import UIKit

struct StatusListView : View {
    @StateObject var viewModel = StatusListViewModel()
    
    var body: some View {
        ZStack {
            List {
                ForEach(viewModel.array) { status in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(status.name):" )
                                .fontWeight(.heavy)
                                .multilineTextAlignment(.leading)
                            Spacer()
                            Text(status.status)
                                .foregroundColor( status.status == "Operational" ? Color.green : Color.pink)
                        }
                        
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle(Text("GitHub Status"))
            .onAppear(perform: {
                self.viewModel.fetchStatus()
            })
        }
    }
}

#if DEBUG
struct StatusListView_Previews : PreviewProvider {
    static var previews: some View {
        StatusListView()
    }
}
#endif
