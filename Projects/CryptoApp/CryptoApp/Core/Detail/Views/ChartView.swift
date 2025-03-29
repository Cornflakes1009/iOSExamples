//
//  ChartView.swift
//  CryptoApp
//
//  Created by Harold Davidson on 3/12/25.
//

import SwiftUI

struct ChartView: View {
    
    let data: [Double]
    let maxY: Double
    let minY: Double
    let lineColor: Color
    let startingDate: Date
    let endingDate: Date
    
    init(coin: CoinModel) {
        data = coin.sparklineIn7D?.price ?? []
        maxY = data.max() ?? 0
        minY = data.min() ?? 0
        
        let priceChange = (data.last ?? 0) - (data.first ?? 0)
        lineColor = priceChange > 0 ? Color.theme.green : Color.theme.red
        
        endingDate = Date(coinGencoString: coin.lastUpdated ?? "")
        startingDate = endingDate.addingTimeInterval(-7*24*60*60) // 7 days, 24 hours, 60 mins, 60 secs.
    }
    
    var body: some View {
        VStack {
            chartView
                .frame(height: 200)
                .background(chartBackground)
                .overlay(chartYAccess, alignment: .leading)
            
            HStack {
                Text("Hi")
                Spacer()
                Text("Hi")
            }
        }
    }
}

#Preview {
    ChartView(coin: PreviewData.coin)
}

extension ChartView {
    
    private var chartBackground: some View {
        VStack {
            Divider()
            Spacer()
            Divider()
            Spacer()
            Divider()
        }
    }
    
    private var chartView: some View {
        GeometryReader { geometry in
            Path { path in
                for index in data.indices {
                    
                    let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
                    
                    let yAxis = maxY - minY // calculating the middle point for the graph
                    
                    let yPosition = (1 - CGFloat((data[index] - minY) / yAxis)) *  geometry.size.height
                    
                    if index == 0 {
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    }
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                    
                    
                }
            }
            .stroke(lineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
        }
    }
    
    private var chartYAccess: some View {
        VStack {
            Text(maxY.formattedWithAbbreviations())
            Spacer()
            Text(((maxY + minY) / 2).formattedWithAbbreviations())
            Spacer()
            Text(minY.formattedWithAbbreviations())
        }
    }
}
