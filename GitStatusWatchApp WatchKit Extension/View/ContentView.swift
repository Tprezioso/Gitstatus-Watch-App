//
//  ContentView.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 9/4/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    var pokemomnList = [
        GitStatusObject(name: "Tom", status: "good"),
        GitStatusObject(name: "Me", status: "good"),
        GitStatusObject(name: "You", status: "bad"),
        GitStatusObject(name: "Tom", status: "good"),
        GitStatusObject(name: "Me", status: "good"),
        GitStatusObject(name: "You", status: "bad")
    ]
    
    var body: some View {

        List(pokemomnList.identified(by:\.name)) { pokemon in
            HStack {
                Text(pokemon.name)
                Text(pokemon.status)
            }

        }
        .navigationBarTitle(Text("GitHub Status"))
    }
}

struct GitHubStatus {
    var body: some View {
        VStack(alignment: .leading){
            Text("Charmander")
            Text("Type: fire")
                .font(.footnote)
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
