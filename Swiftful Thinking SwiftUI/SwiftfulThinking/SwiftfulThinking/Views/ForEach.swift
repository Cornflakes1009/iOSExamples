//
//  ForEachBootcamp.swift
//  SwiftfulThinking
//
//  Created by Harold Davidson on 12/30/24.
//

import SwiftUI

struct ForEachBootcamp: View {
    let data: [String] = ["Hello", "Hi", "Hey everyone"]
    let myString: String = "Hello"
    
    var body: some View {
        VStack {
            ForEach(0..<data.count) {  index in
                Text("\(data[index])")
            }
            
        }
    }
}

#Preview {
    ForEachBootcamp()
}
