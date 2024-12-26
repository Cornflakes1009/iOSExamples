//
//  Frames.swift
//  SwiftfulThinking
//
//  Created by Harold Davidson on 12/25/24.
//

import SwiftUI

struct Frames: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        // CAN DO FRAME WITHIN A FRAME. Each one can have its own background.
        // CAN ALSO CHANGE THE ALIGNMENT OF EACH FRAME. EACH FRAME CAN HAVE ITS OWN ALIGNMENT
//            .background(Color.yellow)
//            .frame(width: 100, height: 100, alignment: .center)
//            .background(Color.red)
//            .frame(width: 200, height: 100, alignment: .center)
//            .background(Color.green)
//            .frame(width: 300, height: 300, alignment: .center)
//            .background(Color.blue)
        
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.blue)
    }
}

#Preview {
    Frames()
}
