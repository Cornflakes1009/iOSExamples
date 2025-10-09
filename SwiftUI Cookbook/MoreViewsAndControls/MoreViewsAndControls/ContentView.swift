//
//  ContentView.swift
//  MoreViewsAndControls
//
//  Created by Harold Davidson on 10/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var progress = 0.5
    @State private var color = Color.red
    @State private var secondColor = Color.yellow
    @State private var someText = "Initial Text"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
