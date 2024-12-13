//
//  Title.swift
//  Authenticator
//
//  Created by Harold Davidson on 12/9/24.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Authenticator")
            .bold()
            .font(.title)
            .foregroundStyle(.white)
    }
}

#Preview {
    Title()
        .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
}
