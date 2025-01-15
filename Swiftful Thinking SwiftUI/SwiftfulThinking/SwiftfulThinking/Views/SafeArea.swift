//
//  SafeArea.swift
//  SwiftfulThinking
//
//  Created by Harold Davidson on 1/14/25.
//

import SwiftUI

struct SafeArea: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Text goes here")
                    .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                ForEach(0..<10) { index in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(.white)
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .padding(20)
                }
            }
            
        }
        // backgrounds are actually Views. If you want to use a color and any properties, you have to use Color.colorName
        .background(
            Color.red
            .ignoresSafeArea(edges: .all)
        )
//        ZStack {
//            // background layer
//            Color.blue
//                .ignoresSafeArea()
//            
//            // foreground layer
//            VStack {
//                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                Spacer()
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            //.background(.red)
//            //.ignoresSafeArea() // by default, this is all edges
//        }
    }
}

#Preview {
    SafeArea()
}
