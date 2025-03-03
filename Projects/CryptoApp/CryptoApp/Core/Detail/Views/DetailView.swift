//
//  DetailView.swift
//  CryptoApp
//
//  Created by Harold Davidson on 3/1/25.
//

import SwiftUI

struct DetailView: View {
    
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
    }
    
    var body: some View {
        Text(coin.name)
    }
}

#Preview {
    DetailView(coin: PreviewData.coin)
}
