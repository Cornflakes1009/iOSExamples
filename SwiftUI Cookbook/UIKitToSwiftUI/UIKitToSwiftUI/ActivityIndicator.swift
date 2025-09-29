//
//  ActivityIndicator.swift
//  UIKitToSwiftUI
//
//  Created by Harold Davidson on 9/27/25.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    var animating: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }
    
    func updateUIView(_ activityIndicator: UIActivityIndicatorView, context: Context) {
        if animating {
            activityIndicator.startAnimating()
        }
    }
}


