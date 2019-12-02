//
//  LoadView.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 12/2/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import SwiftUI
import Combine

struct LoadView: View {
    @State var spinCircle = true
    
    var body: some View {
        Circle()
            .trim(from: 0.5, to: 1)
            .stroke(Color.blue, lineWidth:4)
            .frame(width:100)
            .rotationEffect(.degrees(spinCircle ? 0 : -360), anchor: .center)
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            .onAppear(perform: {
                self.spinCircle.toggle()
                
            })
    }
}

struct LoadView_Previews: PreviewProvider {
    static var previews: some View {
        LoadView()
    }
}
