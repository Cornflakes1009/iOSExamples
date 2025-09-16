//
//  MenuButtonView.swift
//  Buttons
//
//  Created by Harold Davidson on 9/13/25.
//

import SwiftUI

struct MenuButtonView: View {
    var body: some View {
        Menu("Choose a country") {
            Button("Canada") { print("Selected Canada")}
            Button("Mexico") { print("Selected Mexico")}
            Button("USA") { print("Selected USA")}
        }
        .navigationTitle("MenuButtons")
    }
}

#Preview {
    MenuButtonView()
}
