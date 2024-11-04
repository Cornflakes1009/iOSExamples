//
//  ColorsBootcamp.swift
//  SwiftfulThinkingColors
//
//  Created by Harold Davidson on 11/3/24.
//

import SwiftUI

struct ColorsBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
//                Color(uiColor: .secondarySystemBackground)
                Color("CustomColor")
            )
            .frame(width: 300, height: 200)
            //.shadow(radius: 10)
            //.shadow(color: .red, radius: 10, x: 10, y: 20)
        
            // creates a faded shadow to the lower right of the same color as the view
            .shadow(color: Color("CustomColor").opacity(0.5), radius: 10, x: 10, y: 20)
        
    }
}

#Preview {
    ColorsBootcamp()
}
