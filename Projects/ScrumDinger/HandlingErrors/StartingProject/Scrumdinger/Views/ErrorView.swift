//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Harold Davidson on 12/21/24.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("An error has occurred!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
}

//#Preview {
//    enum SampleError: Error {
//        case errorRequired
//    }
//    
//    var wrapper: ErrorWrapper {
//        ErrorWrapper(error: SampleError.errorRequired, guidance: "You can safely ignore this error.")
//    }
//    
//    ErrorView(errorWrapper: wrapper)
//}
