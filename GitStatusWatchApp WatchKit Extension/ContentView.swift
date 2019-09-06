//
//  ContentView.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 9/4/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        List {
            VStack(alignment: .leading){
                Text("Charmander")
                
                Text("Type: fire")
                    .font(.footnote)
            }

            Text("Squirtle")
            Text("Bulbasaur")
            Text("Pikachu")
        }
        .navigationBarTitle(Text("GitHub Status"))
    }
}

struct GitHubStatus {
    var body: some View {
        VStack(alignment: .leading){
            Text("Charmander")
            Text("Type: fire")
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
