//
//  XMarkButton.swift
//  CryptoApp
//
//  Created by Harold Davidson on 2/2/25.
//

import SwiftUI

/// NOTE - This isn't working as expected. Check out PortfolioView to see a workaround button. 
struct XMarkButton: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

#Preview {
    XMarkButton()
}
