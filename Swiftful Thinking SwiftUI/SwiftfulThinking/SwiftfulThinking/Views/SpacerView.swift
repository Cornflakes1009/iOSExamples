//
//  SpacerView.swift
//  SwiftfulThinking
//
//  Created by Harold Davidson on 12/27/24.
//

import SwiftUI

struct SpacerView: View {
    var body: some View {
        
        // Spacers have minimum length (it's about 8 or 10). Spacer(minLength: )
        // You can set the minimum length to allow the views to compress to no spacer if needed
        HStack {
            Spacer()
                .frame(height: 10)
                .background(.orange)
            
            Rectangle()
                .frame(width: 50, height: 50)
            
            Spacer()
                .frame(height: 10)
                .background(.orange)
            
            Rectangle()
                .fill(.red)
                .frame(width: 50, height: 50)
            
            Spacer()
                .frame(height: 10)
                .background(.orange)
            
            Rectangle()
                .fill(.green)
                .frame(width: 50, height: 50)
            
            Spacer()
                .frame(height: 10)
                .background(.orange)
        }
    }
}

#Preview {
    SpacerView()
}
