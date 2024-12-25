//
//  TextView.swift
//  SwiftfulThinking
//
//  Created by Harold Davidson on 12/24/24.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        Text("Hello, world! This is the 2nd video in the course and I'm learning a bit. I look forward to the future videos.".uppercased())
            //.font(.title)
            //.fontWeight(.semibold)
            //.bold()
            //.underline()
            //.underline(true, color: .blue)
            //.italic()
            //.strikethrough()
            //.strikethrough(true, color: .red)
            //.font(.system(size: 24, weight: .semibold, design: .monospaced))
            //.baselineOffset(30)
            //.kerning(10) // spacing between each letter
            .foregroundStyle(.purple)
            .frame(width: 200, height: 100, alignment: .leading)
            .minimumScaleFactor(0.1) // this scales the font automatically to fit inside the specified size
            .multilineTextAlignment(.leading)
    }
}

#Preview {
    TextView()
}
