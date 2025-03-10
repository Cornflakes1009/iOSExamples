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
                VStack(spacing: 20) {
                    Text("")
                        .frame(height: 150)
                    
                    Text("Overview")
                        .font(.title)
                        .bold()
                        .foregroundStyle(Color.theme.accent)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                    
                    LazyVGrid(columns: columns, alignment: .leading, spacing: spacing, content: {
                        ForEach(0..<6) { _ in
                            StatisticView(stat: StatisticModel(title: "Title", value: "Value"))
                        }
                    })
                    Text("Additional Details")
                        .font(.title)
                        .bold()
                        .foregroundStyle(Color.theme.accent)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                    
                    LazyVGrid(columns: columns, alignment: .leading, spacing: spacing, content: {
                        ForEach(0..<6) { _ in
                            StatisticView(stat: StatisticModel(title: "Title", value: "Value"))
                        }
                    })
                }
                .padding()
            }
            .navigationTitle(vm.coin.name)
        }
    }
}

#Preview {
    NavigationView {
        DetailView(coin: PreviewData.coin)
    }
    
}
