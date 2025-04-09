//
//  DetailView.swift
//  CryptoApp
//
//  Created by Harold Davidson on 3/1/25.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
                
            }
        }
    }
}

struct DetailView: View {
    @StateObject private var vm: DetailViewModel
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    private let spacing: CGFloat = 30
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ChartView(coin: vm.coin)
                        .padding(.vertical)
                    VStack(spacing: 20) {
                        overViewTitle
                        Divider()
                        ZStack {
                            if let coinDescription = vm.coinDescription, !coinDescription.isEmpty {
                                VStack(alignment: .leading) {
                                    Text(coinDescription)
                                        .lineLimit(3) // truncates after third line
                                        .font(.callout)
                                        .foregroundStyle(Color.theme.secondaryText)
                                    
                                    Button(action: {
                                        
                                    }, label: {
                                        Text("Read more...")
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .padding(.vertical, 4)
                                    })
                                    .tint(.blue)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        overviewGrid
                        additionalTitle
                        Divider()
                        additionalGrid
                    }
                    .padding()
                }
                
            }
            .navigationTitle(vm.coin.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    navigationBarTrailingItem
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        DetailView(coin: PreviewData.coin)
    }
    
}

extension DetailView {
    private var overViewTitle: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundStyle(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var additionalTitle: some View {
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundStyle(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var overviewGrid: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: spacing, content: {
            ForEach(vm.overviewStatics) { stat in
                StatisticView(stat: stat)
            }
        })
    }
    
    private var additionalGrid: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: spacing, content: {
            ForEach(vm.additionalStatics) { stat in
                StatisticView(stat: stat)
            }
        })
    }
    
    private var navigationBarTrailingItem: some View {
        HStack {
            Text(vm.coin.symbol.uppercased())
                .font(.headline)
                .foregroundStyle(Color.theme.secondaryText)
            CoinImageView(coin: vm.coin)
                .frame(width: 25, height: 25)
        }
    }
}
