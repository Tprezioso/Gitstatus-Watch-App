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
    
    var pokemomnList = [
        GitStatusObject(name: "Tom", status: "good"),
        GitStatusObject(name: "Me", status: "good"),
        GitStatusObject(name: "You", status: "bad"),
        GitStatusObject(name: "Tom", status: "good"),
        GitStatusObject(name: "Me", status: "good"),
        GitStatusObject(name: "You", status: "bad")
    ]

    var body: some View {
        List(pokemomnList, id: \.name) { pokemon in
            HStack {
                Text(pokemon.name)
                Text(pokemon.status)
            }

        }
        .navigationBarTitle(Text("GitHub Status"))
            .onAppear(perform: {
                self.fetch()
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
