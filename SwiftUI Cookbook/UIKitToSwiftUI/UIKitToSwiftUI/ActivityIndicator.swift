//
//  ActivityIndicator.swift
//  UIKitToSwiftUI
//
//  Created by Harold Davidson on 9/27/25.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    var animating: Bool
    
    func makeUIView(context: Context) -> some UIView {
        UIActivityIndicatorView {
            return UIActivityIndicatorView()
        }
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if animating {
            activityIndicator.startAnimating()
        }
    }
}

struct ContentView: View {
    @State private var animate = true
    var body: some View {
        VStack {
            
        }
    }
}
