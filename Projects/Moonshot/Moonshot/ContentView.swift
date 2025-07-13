//
//  ContentView.swift
//  Moonshot
//
//  Created by Harold Davidson on 7/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(.example) // this is done from Xcode/Swift. The image name is actually "Example.jpg"
            .resizable()
            .scaledToFit()
            //.frame(width: 300, height: 300)
        // setting the frame for the image to be presented in 80% of the screen width (.horizonal). 
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.8
            }
    }
}

#Preview {
    ContentView()
}
