//
//  NotificationsCell.swift
//  TikTokClone
//
//  Created by Harold Davidson on 12/7/24.
//

import SwiftUI

struct NotificationsCell: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(Color(.systemGray5))
            
            HStack {
                Text("max.verstappen")
                    .font(.footnote)
                    .fontWeight(.semibold) + // this + concatenates these two Text elements.
                
                Text(" kiked one of your posts. Tap to see which one. ")
                    .font(.footnote) +
                
                Text("3d")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Rectangle()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationsCell()
}
