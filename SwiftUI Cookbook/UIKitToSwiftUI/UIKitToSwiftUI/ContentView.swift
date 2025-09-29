//
//  ContentView.swift
//  UIKitToSwiftUI
//
//  Created by Harold Davidson on 9/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = true
    var body: some View {
        VStack {
            ActivityIndicator(animating: animate)
            HStack {
                Toggle(isOn: $animate) {
                    Text("Toggle Animation")
                }
            }.padding()
        }
    }
}

#Preview {
    ContentView()
}
