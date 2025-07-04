//
//  ContentView.swift
//  Animations
//
//  Created by Harold Davidson on 6/11/25.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}
struct ContentView: View {
    //@State private var animationAmount = 1.0 // used for everything except the coin effect
    @State private var animationAmount = 1.0
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    let letters = Array("Hello SwiftUI")
    @State private var isShowingRed = false
    
    var body: some View {
        // does a sort of fan effect where the red comes down with the top left looking like a hinge
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
        // grows and fades out box
//        VStack {
//            Button("Tap Me") {
//                withAnimation {
//                    isShowingRed.toggle()
//                }
//            }
//            if isShowingRed {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 200, height: 200)
//                    //.transition(.scale) // makes it appear from no size to full size
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
//            }
//        }
        // MARK: - Makes a really cool snake effect
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count, id: \.self) { num in
//                Text(String(letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .background(enabled ? .blue : .red)
//                    .offset(dragAmount)
//                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged { dragAmount = $0.translation }
//                .onEnded { _ in
//                    dragAmount = .zero
//                    enabled.toggle()
//                }
//        )
        // MARK: - Drag around box
//        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(.rect(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//                DragGesture()
//                    .onChanged { dragAmount = $0.translation }
//                    .onEnded { _ in
//                        withAnimation(.bouncy) {
//                            dragAmount = .zero
//                        }
//                    }
//            )
//            .animation(.bouncy, value: dragAmount)
        
        // MARK: - animating box going to circle and red. Corners bounch in and out.
//        Button("Tap Me") {
//            enabled.toggle()
//        }
//        .frame(width: 200, height: 200)
//        .background(enabled ? .blue : .red)
//        .foregroundStyle(.white)
//        //.animation(.default, value: enabled)
//        .animation(nil, value: enabled)
//        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
//        .animation(.spring(duration: 1, bounce: 0.9), value: enabled)
        
        // MARK: - coin rotate with spring to reset
//        Button("Tap Me") {
//            withAnimation(.spring(duration: 1, bounce: 0.5)) { // makes it spring back around
//                animationAmount += 360
//            }
//        }
//        .padding(50)
//        .background(.red)
//        .foregroundStyle(.white)
//        .clipShape(.circle)
//        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        // MARK: - circle starts small and grows with taps
//        VStack {
//            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
//            Spacer()
//            Button("Tap Me") {
//                animationAmount += 1
//            }
//            .padding(40)
//            .background(.red)
//            .foregroundStyle(.white)
//            .clipShape(.circle)
//            .scaleEffect(animationAmount)
//            .animation(.easeOut(duration: 1), value: animationAmount)
//            .onAppear {
//                animationAmount = 1
//            }
//        }
        
        
        // MARK: - Pulse like Radar
        // this does a pulse effect like radar
//        Button("Tap Me") {
//            //animationAmount += 1
//        }
//        .padding(50)
//        .background(.red)
//        .foregroundStyle(.white)
//        .clipShape(.circle)
//        .overlay(
//            Circle()
//                .stroke(.red)
//                .scaleEffect(animationAmount)
//                .opacity(2 - animationAmount)
//                .animation(.easeOut(duration: 1).repeatForever(autoreverses: false), value: animationAmount)
//        )
//        .onAppear {
//            animationAmount = 2
//        }
        
        // MARK: - Bunch of Stuff
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount) // set to 1 to start
        .blur(radius: (animationAmount - 1) * 3) // blurry springy
//        .animation(.default, value: animationAmount)
         // constant - use this for movie poster idea
//        .animation(.linear, value: animationAmount)
         // bouncy
//        .animation(.spring(duration: 1, bounce: 0.9), value: animationAmount)
        // starts slow, speeds up, and slows down
//        .animation(.easeInOut(duration: 2), value: animationAmount)
         // waits one second and then starts slow, speeds up, and slows down
//        .animation(.easeInOut(duration: 2).delay(1), value: animationAmount)
//        .animation(.easeInOut(duration: 2).repeatCount(3, autoreverses: true), value: animationAmount)
         // up > down > up > down ... forever
//        .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: animationAmount)
    }
}

#Preview {
    ContentView()
}
