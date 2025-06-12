//
//  ContentView.swift
//  Animations
//
//  Created by Harold Davidson on 6/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3) // this makes it blurry
        .animation(.default, value: animationAmount)
    }
}

#Preview {
    ContentView()
}
