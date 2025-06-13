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
        
        // this does a pulse effect like radar
        Button("Tap Me") {
            //animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(.easeOut(duration: 1).repeatForever(autoreverses: false), value: animationAmount)
        )
        .onAppear {
            animationAmount = 2
        }
        
//        Button("Tap Me") {
//            animationAmount += 1
//        }
//        .padding(50)
//        .background(.red)
//        .foregroundStyle(.white)
//        .clipShape(.circle)
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3) // this makes it blurry
        // springy
        //.animation(.default, value: animationAmount)
        // constant - use this for movie poster idea
        //.animation(.linear, value: animationAmount)
        // bouncy
        //.animation(.spring(duration: 1, bounce: 0.9), value: animationAmount)
        // starts slow, speeds up, and slows down
        //.animation(.easeInOut(duration: 2), value: animationAmount)
        // waits one second and then starts slow, speeds up, and slows down
        //.animation(.easeInOut(duration: 2).delay(1), value: animationAmount)
        //.animation(.easeInOut(duration: 2).repeatCount(3, autoreverses: true), value: animationAmount)
        // up > down > up > down ... forever
        //.animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: animationAmount)
    }
}

#Preview {
    ContentView()
}
