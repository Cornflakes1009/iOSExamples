//
//  ListingImageCarouselView.swift
//  AirBnb Clone
//
//  Created by Harold Davidson on 11/11/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    
    let listing: Listing
    
    var body: some View {
        TabView{
            ForEach(listing.imageUrls, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
