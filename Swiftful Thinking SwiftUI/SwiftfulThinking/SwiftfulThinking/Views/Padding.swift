//
//  Padding.swift
//  SwiftfulThinking
//
//  Created by Harold Davidson on 12/27/24.
//

import SwiftUI

struct Padding: View {
    var body: some View {
        
        // .padding() defaults to .padding(.all, 10)
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            
            Text("This is the description of what we will do on this screen. It is multiple ines and we will align the text to the leading edge.")
        }
        .padding()
        .padding(.vertical, 10)
        .background(
            Color.white
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0.0, y: 10))
        .padding(.horizontal, 10)
            
    }
}

#Preview {
    Padding()
}
