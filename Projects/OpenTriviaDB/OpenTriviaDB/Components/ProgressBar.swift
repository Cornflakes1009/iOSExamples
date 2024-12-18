//
//  ProgressBar.swift
//  OpenTriviaDB
//
//  Created by Harold Davidson on 12/10/24.
//

import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 4)
                .foregroundStyle(Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Rectangle()
                .frame(width: progress, height: 4)
                .foregroundStyle(Color("AccentColor"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
    }
}

#Preview {
    ProgressBar(progress: 50.0)
}
