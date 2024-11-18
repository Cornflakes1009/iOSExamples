//
//  ListingItemView.swift
//  AirBnb Clone
//
//  Created by Harold Davidson on 11/9/24.
//

import SwiftUI

struct ListingItemView: View {
    
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            ListingImageCarouselView()
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            // listing details
            HStack(alignment: .top) {
                // details
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                    
                    Text("12 miles away")
                        .foregroundStyle(.gray)
                    
                    Text("Mov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack {
                        Text("$567")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                   
                }
                
                Spacer()
                
                // rating
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("4.86")
                }
                .foregroundStyle(.black)
            }
            .foregroundStyle(.black)
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    ListingItemView()
}
