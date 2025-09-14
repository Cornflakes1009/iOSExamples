//
//  ContentView.swift
//  UsingImages
//
//  Created by Harold Davidson on 9/13/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(.dogs1)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            // Overlay, clipshape, frame, and shadow
            Image(.dogAndNature)
                .resizable() // makes image grow/shrink to fit
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(.blue, lineWidth: 6))
                .shadow(radius: 10)
            
            // UIImage Initializer
            Image(uiImage: UIImage(resource: .dog2))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
