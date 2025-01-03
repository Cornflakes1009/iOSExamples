//
//  ScrollViews.swift
//  SwiftfulThinking
//
//  Created by Harold Davidson on 1/2/25.
//

import SwiftUI

struct ScrollViews: View {
    var body: some View {
        // this scrolls left to right
        //        ScrollView(.horizontal, showsIndicators: false) {
        //            HStack {
        //                ForEach(0..<50) { index in
        //                    Rectangle()
        //                        .fill(.red)
        //                        .frame(width: 300, height: 300)
        //                }
        //            }
        //        }
        
        // this scrolls like a UITableView
        // indicator is the bar on the right or bottom side showing the scroll status
        //        ScrollView(.vertical, showsIndicators: false) {
        //            VStack {
        //                ForEach(0..<50) { index in
        //                    Rectangle()
        //                        .fill(.blue)
        //                        .frame(height: 300)
        //                }
        //            }
        //        }
        
        // making it a LazyVStack makes it so that it only creates the rows that it needs to (like what's on the screen now). Better for larger data sets
        ScrollView {
            LazyVStack {
                ForEach(0..<10) { index in
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack {
                            ForEach(0..<20) { index in
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                    })
                    
                }
            }
        }
    }
}

#Preview {
    ScrollViews()
}
