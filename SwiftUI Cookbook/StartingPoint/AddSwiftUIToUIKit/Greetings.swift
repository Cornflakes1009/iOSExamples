//
//  Greetings.swift
//  AddSwiftUIToUIKit
//
//  Created by Harold Davidson on 10/5/25.
//

import SwiftUI

struct Greetings: View {
    var textFromUIKit: String
    var body: some View {
        Text(textFromUIKit)
    }
}

#Preview {
    Greetings(textFromUIKit: "Hello, world!")
}
