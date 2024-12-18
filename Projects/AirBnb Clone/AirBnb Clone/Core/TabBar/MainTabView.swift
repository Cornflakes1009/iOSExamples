//
//  MainTabView.swift
//  AirBnb Clone
//
//  Created by Harold Davidson on 11/15/24.
//

import SwiftUI

struct MainTabView: View {
    let listing: Listing
    var body: some View {
        TabView {
            ExploreView(listing: listing)
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
            
            WishlistsView()
                .tabItem { Label("Wishlists", systemImage: "heart") }
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
        }
    }
}

#Preview {
    MainTabView(listing: DeveloperPreview.shared.listings[0])
}
