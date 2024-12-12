//
//  PrimaryButton.swift
//  OpenTriviaDB
//
//  Created by Harold Davidson on 12/10/24.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color = Color("AccentColor")
    
    var body: some View {
        Text(text)
            .foregroundStyle(.white)
            .padding()
            .frame(width: 120)
            .background(background)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(radius: 10)
    }
}

#Preview {
    PrimaryButton(text: "Next")
}
