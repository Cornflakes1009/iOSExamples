//
//  ExploreView.swift
//  TikTokClone
//
//  Created by Harold Davidson on 12/7/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(0 ..< 20 ) { user in
                        UserCell()
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.top)
    }
}

#Preview {
    ExploreView()
}
