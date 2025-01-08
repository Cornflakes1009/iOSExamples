//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Harold Davidson on 1/6/25.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar(.hidden)
            }
        }
    }
}
