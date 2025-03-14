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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ChartView(coin: PreviewData.coin)
}
