//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Harold Davidson on 1/10/25.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject { // observable object is so that it can be observed from the view
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // this updates allCoins
        $searchText
            .combineLatest(dataService.$allCoins) // if either the search text or allcoins gets changed, this calls
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main) // this waits a half second before running the code below. 
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else { return coins } // there's no search text entered
        
        let lowercasedText = text.lowercased()
        
        return coins.filter { (coin) in // trying to find if the text entered matches the name, symbol, or id of any coins
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.contains(lowercasedText)
        }
    }
}
