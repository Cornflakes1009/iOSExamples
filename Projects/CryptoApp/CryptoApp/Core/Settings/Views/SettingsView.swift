//
//  SettingsView.swift
//  CryptoApp
//
//  Created by Harold Davidson on 4/11/25.
//

import SwiftUI

let defaultURL = URL(string: "https://www.google.com")!
let youTubeURL = URL(string: "https://www.youtube.com/c/swiftfulthinking")!
let coffeeURL = URL(string: "https://www.buymeacoffee.com/nicksarno")!
let coinGeckoURL = URL(string: "https://www.coingecko.com")!
let personalURL = URL(string: "https://www.cornflakes1009.github.io/references")!

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Header")) {
                    VStack(alignment: .leading) {
                        Image("logo")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        Text("This app was made by following a YouTube tutorial")
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundStyle(Color.theme.accent)
                    }
                    .padding(.vertical)
                    Link("Subscribe on YouTube 🥳", destination: youTubeURL)
                    Link("Support his coffee addiction ☕️", destination: coffeeURL)
                }
            }
            .font(.headline)
            .tint(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
