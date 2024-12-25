//
//  Images.swift
//  SwiftfulThinking
//
//  Created by Harold Davidson on 12/24/24.
//

import SwiftUI

struct Images: View {
    var body: some View {
        //Image("redwoods")
        Image("google")
            .renderingMode(.template) // use this to make it an icon whose color you can change
            .resizable()
            .frame(width: 300, height: 300)
            //.aspectRatio(contentMode: .fill)
            .scaledToFit() // same thing as aspect ratio .fill
            .clipped() // this fits the frame
            //.clipShape(RoundedRectangle(cornerRadius: 150))
            .clipShape(Circle()) // Circle is the default clipShape and will make the image circular
        
            .foregroundStyle(.red) // along with renderingMode(.template), set this to make it an icon
        
        // to always render an image as an icon, you can go to Assets.xcassets > Attributes Inspector > Reder As > set Template Image
        
    }
}

#Preview {
    Images()
}
