//
//  LaunchView.swift
//  CryptoApp
//
//  Created by Harold Davidson on 4/16/25.
//

import SwiftUI

struct LaunchView: View {
    @State private var loadingText: String = "Loading your portfolio..."
    @State private var showLoadingText: Bool = false
    
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
                    Text(loadingText)
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.launch.accent)
                        .transition(AnyTransition.scale.animation(.easeIn))
                }
                
            }
            .offset(y: 70)
        }
        .onAppear {
            showLoadingText.toggle()
        }
    }
}

#Preview {
    LaunchView()
}
