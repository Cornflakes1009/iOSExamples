//
//  BackgroundsAndOverlays.swift
//  SwiftfulThinking
//
//  Created by Harold Davidson on 12/25/24.
//

import SwiftUI

struct BackgroundsAndOverlays: View {
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        // backgrounds can be colors, gradients, images, views, shapes, etc.
        // backgrounds go behind each other while overlays go on top of each other
        
        // MARK: - Background
        //            .background(
        //                Circle()
        //                    .fill(LinearGradient(colors: [.red, .blue], startPoint: .leading, endPoint: .trailing))
        //                    .frame(width: 100, height: 100, alignment: .center)
        //
        //            )
        //            .background(
        //                Circle()
        //                    .fill(LinearGradient(colors: [.blue, .red], startPoint: .leading, endPoint: .trailing))
        //                    .frame(width: 120, height: 120, alignment: .center)
        //            )
        
        
        // MARK: - Overlay
//        Circle()
//            .fill(.pink)
//            .frame(width: 100, height: 100, alignment: .center)
//            .overlay(
//                Text("1")
//                    .font(.largeTitle)
//                    .foregroundStyle(.white)
//            )
//            .background(
//                Circle()
//                    .fill(.purple)
//                    .frame(width: 120, height: 120)
//            )
        
        // MARK: - Overlay and a Background together
//        Rectangle()
//            .frame(width: 100, height: 100)
//            .overlay(alignment: .topLeading) {
//                Rectangle()
//                .fill(.blue)
//                .frame(width: 50, height: 50)
//                
//            }
//            .background(
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 150, height: 150)
//                , alignment: .bottomTrailing // comes from .background
//            )
        
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundStyle(.white)
            .background(
                Circle()
                    .fill(LinearGradient(colors: [.red, .blue], startPoint: .leading, endPoint: .trailing))
                    .frame(width: 100, height: 100)
                    .shadow(color: .black, radius: 50, x: 0, y: 0)
                    .shadow(color: .blue, radius: 10, x: 10, y: 5)
                    .shadow(color: .red, radius: 10, x: -10, y: 5)
                    
                    .overlay(alignment: .bottomTrailing, content: {
                        Circle()
                            .fill(.red)
                            .frame(width: 35, height: 35)
                            .overlay(
                                Text("5")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                            )
                            .shadow(color: .red, radius: 10, x: 3, y: 3)
                    })
                )
    }
}

#Preview {
    BackgroundsAndOverlays()
}
