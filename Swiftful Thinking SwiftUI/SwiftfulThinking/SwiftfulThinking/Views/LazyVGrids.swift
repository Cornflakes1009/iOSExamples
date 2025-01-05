//
//  LazyVGrids.swift
//  SwiftfulThinking
//
//  Created by Harold Davidson on 1/4/25.
//

import SwiftUI

struct LazyVGrids: View {
    let columns: [GridItem] = [
        // fixed property
//        GridItem(.fixed(50), spacing: nil, alignment: nil),
//        GridItem(.fixed(75), spacing: nil, alignment: nil),
//        GridItem(.fixed(190), spacing: nil, alignment: nil),
//        GridItem(.fixed(75), spacing: nil, alignment: nil),
//        GridItem(.fixed(50), spacing: nil, alignment: nil),
        
        // flexible property
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),
        
        // adaptive property - this fits in as many items in so long as it meets the min/max requirements
//        GridItem(.adaptive(minimum: 50, maximum: 300), spacing: nil, alignment: nil),
//        GridItem(.adaptive(minimum: 150, maximum: 300), spacing: nil, alignment: nil),
        
        
    ]
    var body: some View {
        ScrollView {
//            Image("redwoods")
//                .frame(width: 300, height: 400)
//                .frame(maxWidth: .infinity)
//                .aspectRatio(contentMode: .fill)
//                .clipped()
            
            Rectangle()
                .fill(.orange)
                .frame(height: 400)
            
            // the default spacing is around 6.
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 6,
                pinnedViews: [.sectionHeaders], // this makes the section label stick to the top (Section 1 or Section 2)
                content: {
                    Section {
                        ForEach(0..<50) { index in
                            Rectangle()
                                .frame(height: 150)
                        }
                    } header: {
                        Text("Section 1")
                            .background(.blue)
                            .font(.title)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.blue)
                            .padding()
                    }

                    Section {
                        ForEach(0..<50) { index in
                            Rectangle()
                                .fill(.green)
                                .frame(height: 150)
                        }
                    } header: {
                        Text("Section 2")
                            .background(.red)
                            .font(.title)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.red)
                            .padding()
                    }
                    
                        
            })
//            LazyVGrid(columns: columns) {
//                ForEach(0..<50) { index in
//                    Rectangle()
//                        .frame(height: 150)
//                }
//            }
        }
    }
}

#Preview {
    LazyVGrids()
}
