//
//  ContentView.swift
//  Moonshot
//
//  Created by Harold Davidson on 7/11/25.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
    }
    
    init(text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}


struct ContentView: View {
    var body: some View {
        //        Image(.example) // this is done from Xcode/Swift. The image name is actually "Example.jpg"
        //            .resizable()
        //            .scaledToFit()
        //            //.frame(width: 300, height: 300)
        //        // setting the frame for the image to be presented in 80% of the screen width (.horizonal).
        //            .containerRelativeFrame(.horizontal) { size, axis in
        //                size * 0.8
        //            }
        
        ScrollView(.vertical) {
            // LazyVStack only builds items as needed
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText(text: "Item \($0)")
                        .font(.headline)
                }
            }
            .frame(maxWidth: .infinity) // if you don't set the width, it assumes that it's the width of the content and you can only scroll when you interact with the items themselves. It would be very thin.
        }
    }
}

#Preview {
    ContentView()
}
