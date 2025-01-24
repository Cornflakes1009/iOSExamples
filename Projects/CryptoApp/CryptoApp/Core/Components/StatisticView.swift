//
//  StatisticView.swift
//  CryptoApp
//
//  Created by Harold Davidson on 1/23/25.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
            
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
            
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    // if % change doesn't exist, set to 0. if the change is 0 or greater, up arrow. Else down arrow.
                    .rotationEffect(Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180))
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                .bold()
            }
            // set red/green to for positive/negative % change
            .foregroundStyle((stat.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0) // if there isn't a % change, hide it. Hide (not remove) to keep spacing.
        }
    }
}

#Preview {
    StatisticView(stat: PreviewData().stat3)
}
