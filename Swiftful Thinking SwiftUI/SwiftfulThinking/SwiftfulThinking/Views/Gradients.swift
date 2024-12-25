//
//  Gradients.swift
//  SwiftfulThinking
//
//  Created by Harold Davidson on 12/24/24.
//

import SwiftUI

struct Gradients: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
                // top left to bottom right
                //                LinearGradient(
                //                    gradient: Gradient(colors: [Color.red, .white, Color.blue]),
                //                    startPoint: .topLeading,
                //                    endPoint: .bottomTrailing)
                
                
                //                RadialGradient(colors: [.red, .blue],
                //                               center: .topLeading,
                //                               startRadius: 5,
                //                               endRadius: 400)
                
                AngularGradient(gradient:
                                    Gradient(colors: [Color.red, Color.blue]),
                                center: .topLeading,
                                angle: .degrees(180 + 45))
            )
            .frame(width: 300, height: 200)
        
    }
}

#Preview {
    Gradients()
}
