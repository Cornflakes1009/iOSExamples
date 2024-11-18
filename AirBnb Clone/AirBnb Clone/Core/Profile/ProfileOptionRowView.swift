//
//  ProfileOptionRowView.swift
//  AirBnb Clone
//
//  Created by Harold Davidson on 11/15/24.
//

import SwiftUI

struct ProfileOptionRowView: View {
    let imageName: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
            
            Text(title)
                .font(.subheadline)
            
            Spacer()
            
            Image(systemName: "chevron.right")
        }
        
        Divider()
    }
}

#Preview {
    ProfileOptionRowView(imageName: "gear", title: "Settings")
}
