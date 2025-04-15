//
//  SettingsView.swift
//  CryptoApp
//
//  Created by Harold Davidson on 4/11/25.
//

import SwiftUI


struct SettingsView: View {
    let defaultURL = URL(string: "https://www.google.com")!
    let youTubeURL = URL(string: "https://www.youtube.com/c/swiftfulthinking")!
    let coffeeURL = URL(string: "https://www.buymeacoffee.com/nicksarno")!
    let coinGeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://www.cornflakes1009.github.io/references")!
    
    var body: some View {
        NavigationView {
            List {
                swiftfulThinkingSection
                coinGeckSection
                developerSection
                applicationSection
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


#Preview {
    SettingsView()
}

extension SettingsView {
    private var swiftfulThinkingSection: some View {
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
    
    private var coinGeckSection: some View {
        Section(header: Text("Coin Gecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This cryptocurrency data used in this app comes from a free API from Coin Gecko. Prices may be delayed because it's a free API.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit Coin Gecko 🦎", destination: coinGeckoURL)
            
        }
    }
    
    private var developerSection: some View {
        Section(header: Text("Developer")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was developer by Harold Davidson from a Swiftful Thinking tutorial")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit Website 👨‍💻", destination: personalURL)
            
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Application")) {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More", destination: defaultURL)
            
        }
    }
}
