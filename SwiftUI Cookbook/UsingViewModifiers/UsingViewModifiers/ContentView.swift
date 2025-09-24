//
//  ContentView.swift
//  UsingViewModifiers
//
//  Created by Harold Davidson on 9/22/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // using a View Modifier directly
        Text("Perfect").modifier(BackgroundStyle(bgColor: .blue))
        
        // using an extension on View. Still uses the View Modifier, but applies it directly. Less code overall. 
        Text("Perfecter")
            .backgroundStyle(color: Color.red)
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

extension View {
    func backgroundStyle(color: Color) -> some View {
        self.modifier(BackgroundStyle(bgColor: color))
    }
}
