//
//  ChartView.swift
//  CryptoApp
//
//  Created by Harold Davidson on 3/12/25.
//

import SwiftUI

struct ChartView: View {
    
    let data: [Double]
    
    init(coin: CoinModel) {
        data = coin.sparklineIn7D?.price ?? []
    }
    
    var body: some View {
        Path { path in
            for index in data.indices {
                let xPosition = UIScreen.main.bounds.width / CGFloat(data.count) * CGFloat(index + 1)
                
                
                
            }
        }
    }
}

#Preview {
    ChartView(coin: PreviewData.coin)
}
