//
//  Initializers.swift
//  SwiftfulThinking
//
//  Created by Harold Davidson on 12/27/24.
//

import SwiftUI

struct Initializers: View {
    let backgroundColor: Color
    let count: Int
    let title: String
    
    init(count: Int, fruit: Fruit) {
        self.count = count
        
        switch fruit {
        case .apple:
            self.title = "Apples"
            self.backgroundColor = .red
        case .orange:
            self.title = "Oranges"
            self.backgroundColor = .orange
        }
    }
    
    enum Fruit {
        case apple
        case orange
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .underline()
            Text("\(title)")
                .font(.headline)
                .foregroundStyle(.white)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    HStack {
        Initializers(count: 25, fruit: .apple)
        Initializers(count: 17, fruit: .orange)
    }
    
}
