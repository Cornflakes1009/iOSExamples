//
//  DetailViewModel.swift
//  CryptoApp
//
//  Created by Harold Davidson on 3/6/25.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    @Published var overviewStatics: [StatisticModel] = []
    @Published var additionalStatics: [StatisticModel] = []
    
    @Published var coin: CoinModel
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        let na = "n/a"
        coinDetailService.$coinDetails
            .combineLatest($coin)
            .map({ (coinDetailMode, coinModel) -> (overview: [StatisticModel], additional: [StatisticModel]) in
                
                // overview array
                let price = coinModel.currentPrice.asCurrencyWith6Decimals()
                let pricePercentChange = coinModel.priceChangePercentage24H
                let priceStat = StatisticModel(title: "Current Price", value: price, percentageChange: pricePercentChange)
                
                let marketCap = "$" + (coinModel.marketCap?.formattedWithAbbreviations() ?? "")
                let marketCapPercentChange = coinModel.marketCapChangePercentage24H
                let marketCapStat = StatisticModel(title: "Market Capitalization", value: marketCap, percentageChange: marketCapPercentChange)
                
                let rank = "\(coinModel.rank)"
                let rankStat = StatisticModel(title: "Rank", value: rank)
                
                let volume = "$" + (coinModel.totalVolume?.formattedWithAbbreviations() ?? "")
                let volumeStat = StatisticModel(title: "Volume", value: volume)
                
                let overviewArray: [StatisticModel] = [priceStat, marketCapStat, rankStat, volumeStat]
                
                // additional array
                let high = coinModel.high24H?.asCurrencyWith6Decimals() ?? na
                let highStat = StatisticModel(title: "24h High", value: high)
                
                let low = coinModel.low24H?.asCurrencyWith6Decimals() ?? na
                let lowStat = StatisticModel(title: "24h Low", value: low)
                
                let priceChange = coinModel.priceChange24H?.asCurrencyWith6Decimals() ?? na
                let pricePercentChange2 = coinModel.priceChangePercentage24H
                let priceChangeStat = StatisticModel(title: "24h Price Change", value: priceChange, percentageChange: pricePercentChange2)
                
                let marketCapChange = "$" + (coinModel.marketCapChangePercentage24H?.formattedWithAbbreviations() ?? "")
                let marketCapPercentChange2 = coinModel.marketCapChangePercentage24H
                let marketCapChangeStat = StatisticModel(title: "24h Market Cap Change", value: marketCapChange, percentageChange: marketCapPercentChange2)
                
                let additionalArray : [StatisticModel] = []
                
                return (overviewArray, additionalArray)
            })
            .sink { (returnedArrays) in
                print(returnedArrays.overview)
                print(returnedArrays.additional)
            }
            .store(in: &cancellables)
    }
}
