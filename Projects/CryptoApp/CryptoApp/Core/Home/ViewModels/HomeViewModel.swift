//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Harold Davidson on 1/10/25.
//

import Foundation

class HomeViewModel: ObservableObject { // observable object is so that it can be observed from the view
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.allCoins.append(PreviewData.coin)
            self.portfolioCoins.append(PreviewData.coin)
        }
        
        
    }
}
