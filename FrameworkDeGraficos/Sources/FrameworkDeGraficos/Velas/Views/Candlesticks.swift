//
//  SwiftUIView.swift
//  
//
//  Created by Débora Kassardjian on 28/10/21.
//

import SwiftUI

struct Candlesticks: View {
    let data: [CandleStickData]
    let increaseColor: Color
    let decreaseColor: Color
    
    var body: some View {
        GeometryReader { proxy in
            let drawData = DataNormalizer.shared.normalizeCandlestickData(data, height: proxy.size.height, increaseColor: increaseColor, decreaseColor: decreaseColor)
            ScrollView(.horizontal) {
                VStack {
                    HStack(alignment: .top) {
                        ForEach(data.indices, id: \.self) { index in
                            Candlestick(data: drawData[index])
                                .padding(.horizontal, 1)
                                .offset(x: 0, y: drawData[index].highStroke)
                                .padding(0)
                        }
                    }
                    Spacer()
                }
            }.frame(height: proxy.size.height)
        }
    }
}

struct CandlestickChart_Previews: PreviewProvider {
    static var previews: some View {
        CandleStickAxis(xLabels: ["jan", "fev", "mar"], yLabels: ["5000", "4000", "3000", "2000", "1000"], barColor: .primary, labelColor: .primary) {
            Candlesticks(data: [CandleStickData(highestTradedPrice: 200,
                                                   lowestTradedPrice: 100,
                                                   openTradedPrice: 170,
                                                   closeTradedPrice: 150),
                                   CandleStickData(highestTradedPrice: 100,
                                                   lowestTradedPrice: 0,
                                                   openTradedPrice: 70,
                                                   closeTradedPrice: 50),
                                   CandleStickData(highestTradedPrice: 150,
                                                   lowestTradedPrice: 70,
                                                   openTradedPrice: 90,
                                                   closeTradedPrice: 150),
                                   CandleStickData(highestTradedPrice: 200,
                                                   lowestTradedPrice: 100,
                                                   openTradedPrice: 170,
                                                   closeTradedPrice: 150),
                                   CandleStickData(highestTradedPrice: 100,
                                                   lowestTradedPrice: 0,
                                                   openTradedPrice: 70,
                                                   closeTradedPrice: 50),
                                   CandleStickData(highestTradedPrice: 150,
                                                   lowestTradedPrice: 70,
                                                   openTradedPrice: 90,
                                                   closeTradedPrice: 150),
                                   CandleStickData(highestTradedPrice: 200,
                                                   lowestTradedPrice: 100,
                                                   openTradedPrice: 170,
                                                   closeTradedPrice: 150),
                                   CandleStickData(highestTradedPrice: 100,
                                                   lowestTradedPrice: 0,
                                                   openTradedPrice: 70,
                                                   closeTradedPrice: 50),
                                   CandleStickData(highestTradedPrice: 150,
                                                   lowestTradedPrice: 70,
                                                   openTradedPrice: 90,
                                                   closeTradedPrice: 150),
                                   CandleStickData(highestTradedPrice: 200,
                                                   lowestTradedPrice: 100,
                                                   openTradedPrice: 170,
                                                   closeTradedPrice: 150),
                                   CandleStickData(highestTradedPrice: 100,
                                                   lowestTradedPrice: 0,
                                                   openTradedPrice: 70,
                                                   closeTradedPrice: 50),
                                   CandleStickData(highestTradedPrice: 150,
                                                   lowestTradedPrice: 70,
                                                   openTradedPrice: 90,
                                                   closeTradedPrice: 150),
                                   CandleStickData(highestTradedPrice: 200,
                                                   lowestTradedPrice: 100,
                                                   openTradedPrice: 170,
                                                   closeTradedPrice: 150),
                                   CandleStickData(highestTradedPrice: 100,
                                                   lowestTradedPrice: 0,
                                                   openTradedPrice: 70,
                                                   closeTradedPrice: 50),
                                   CandleStickData(highestTradedPrice: 150,
                                                   lowestTradedPrice: 70,
                                                   openTradedPrice: 90,
                                                   closeTradedPrice: 150),
                                   CandleStickData(highestTradedPrice: 200,
                                                   lowestTradedPrice: 100,
                                                   openTradedPrice: 170,
                                                   closeTradedPrice: 150),
                                   CandleStickData(highestTradedPrice: 100,
                                                   lowestTradedPrice: 0,
                                                   openTradedPrice: 70,
                                                   closeTradedPrice: 50),
                                   CandleStickData(highestTradedPrice: 150,
                                                   lowestTradedPrice: 70,
                                                   openTradedPrice: 90,
                                                   closeTradedPrice: 150)], increaseColor: .green, decreaseColor: .red).padding()
            
        }.previewLayout(.fixed(width: 500, height: 500))
    }
}
