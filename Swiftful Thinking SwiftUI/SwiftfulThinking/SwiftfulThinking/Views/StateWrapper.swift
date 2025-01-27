//
//  StateWrapper.swift
//  SwiftfulThinking
//
//  Created by Harold Davidson on 1/26/25.
//

import SwiftUI

struct StateWrapper: View {
    
    // @State just updates the view. It's like a view listener. 
    @State var backgroundColor = Color.green
    @State var myTitle = "My Title"
    @State var count = 0
    
    var body: some View {
        ZStack {
            // background
            backgroundColor
                .ignoresSafeArea(edges: .all)
            
            // content
            VStack(spacing: 20) {
                Text(myTitle)
                    .font(.title)
                Text("Count: \(count)")
                    .font(.headline)
                    .underline()
                
                HStack(spacing: 20) {
                    Button("BUTTON 1") {
                        backgroundColor = .green
                        myTitle = "Button 1 was tapped"
                        count += 1
                    }
                    
                    Button("BUTTON 2") {
                        backgroundColor = .red
                        myTitle = "Button 2 was tapped"
                        count -= 1
                    }
                }
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    StateWrapper()
}
