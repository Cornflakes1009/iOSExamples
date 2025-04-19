//
//  LaunchView.swift
//  CryptoApp
//
//  Created by Harold Davidson on 4/16/25.
//

import SwiftUI

struct LaunchView: View {
    @State private var loadingText: [String] = "Loading your portfolio...".map { String($0) }
    @State private var showLoadingText: Bool = false
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var counter: Int = 0
    @State private var loops = 0
    @Binding var showLaunchView: Bool
    
    var body: some View {
        ZStack {
            Color.launch.background
                .ignoresSafeArea()
            
            Image("logo-transparent")
                .resizable()
                .frame(width: 100, height: 100)
            
            // this ZStack is offset even though it's over the top of the image. The image should be the absolute center of the screen so that it transitions from the LaunchScreen.storyboard to this file seamlessly.
            ZStack {
                if showLoadingText {
                    HStack(spacing: 0) {
                        ForEach(0..<loadingText.count, id: \.self) { index in
                            Text(loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundStyle(Color.launch.accent)
                                .offset(y: counter == index ? -5 : 0)

                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
                
            }
            .offset(y: 70)
        }
        .onAppear {
            showLoadingText.toggle()
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.spring()) {
                let lastIndex = loadingText.count - 1
                if counter == lastIndex {
                    counter = 0
                    loops += 1
                    if loops >= 2 {
                        showLaunchView = false
                    }
                } else {
                    counter += 1
                }
                
            }
        })
    }
}

#Preview {
    LaunchView(showLaunchView: .constant(true))
}
