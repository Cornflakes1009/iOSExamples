//
//  Stacks.swift
//  SwiftfulThinking
//
//  Created by Harold Davidson on 12/26/24.
//

import SwiftUI

struct Stacks: View {
    var body: some View {
        // VStack and HStack comes with alignment and spacing by default - which is about 8
        HStack( spacing: 0) {
            Rectangle()
                .fill(.red)
                .frame(width: 150, height: 150)
            Rectangle()
                .fill(.green)
                .frame(width: 125, height: 125)
            Rectangle()
                .fill(.orange)
                .frame(width: 100, height: 100)
            
            //Spacer()
        }
    }
}

#Preview {
    Stacks()
}
