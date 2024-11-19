//
//  AirBnb_CloneApp.swift
//  AirBnb Clone
//
//  Created by Harold Davidson on 11/9/24.
//

import SwiftUI

@main
struct AirBnb_CloneApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView(listing: DeveloperPreview.shared.listings[0])
        }
    }
}
