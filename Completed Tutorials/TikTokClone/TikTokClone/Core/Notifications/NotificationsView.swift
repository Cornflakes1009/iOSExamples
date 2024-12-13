//
//  NotificationsView.swift
//  TikTokClone
//
//  Created by Harold Davidson on 12/7/24.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 24, content: {
                    ForEach(1..<20) { notification in
                        NotificationsCell()
                        
                    }
                })
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top)
        }
    }
}

#Preview {
    NotificationsView()
}
