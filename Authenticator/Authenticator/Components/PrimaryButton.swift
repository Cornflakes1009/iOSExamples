//
//  PrimaryButton.swift
//  Authenticator
//
//  Created by Harold Davidson on 12/9/24.
//

import SwiftUI

struct PrimaryButton: View {
    var image: String?
    var showImage = true
    var text: String
    
    var body: some View {
        HStack {
            if showImage {
                Image(systemName: image ?? "person.fill")
            }
            
            Text(text)
        }
        .padding()
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
        )
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
        )
        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    PrimaryButton(image: "faceid", text: "Login with FaceID")
}
