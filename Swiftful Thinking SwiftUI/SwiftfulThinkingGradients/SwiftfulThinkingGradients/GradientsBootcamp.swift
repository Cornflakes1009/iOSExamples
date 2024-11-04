//
//  GradientsBootcamp.swift
//  SwiftfulThinkingGradients
//
//  Created by Harold Davidson on 11/3/24.
//

import SwiftUI

struct GradientsBootcamp: View {
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
    GradientsBootcamp()
}
