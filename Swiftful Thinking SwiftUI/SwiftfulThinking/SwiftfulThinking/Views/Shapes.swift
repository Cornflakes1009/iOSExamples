//
//  Shapes.swift
//  SwiftfulThinking
//
//  Created by Harold Davidson on 12/24/24.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
//        Circle()
//            .fill(.brown)
//            .foregroundColor(.red)
//            .stroke(.red, lineWidth: 10) // stroke is just the outline
//            .stroke(lineWidth: 10)
//
//         makes a circle with a dashed line
//            .stroke(.orange, style: StrokeStyle(lineWidth: 20, lineCap: .butt, dash: [5]))
            
//            .trim(from: 0.2, to: 1.0) // must be before stroke
//            .stroke(.orange, lineWidth: 50.0)
        
        
//        Ellipse()
//            .frame(width: 200, height: 100)
        
//        Capsule()
//            .frame(width: 200, height: 100)
        
//        Rectangle()
        
        RoundedRectangle(cornerRadius: 50)
            .frame(width: 200, height: 100)
        
    }
}

#Preview {
    Shapes()
}
