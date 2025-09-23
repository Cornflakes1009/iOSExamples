//
//  ContentView.swift
//  UsingViewModifiers
//
//  Created by Harold Davidson on 9/22/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Perfect")
    }
}

#Preview {
    ContentView()
}

struct BackgroundStyle: ViewModifier {
    var bgColor: Color
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width * 0.3)
            .foregroundStyle(.black)
            .padding()
            .background(bgColor)
            .cornerRadius(20)
    }
}
