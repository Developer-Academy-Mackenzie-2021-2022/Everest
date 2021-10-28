//
//  SwiftUIView.swift
//  
//
//  Created by Débora Kassardjian on 28/10/21.
//

import SwiftUI

struct CandlestickChart: View {
    let data: [CandleStickData] = [CandleStickData(highestTradedPrice: 200,
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
                                                   closeTradedPrice: 150)]
    var body: some View {
        
        GeometryReader { proxy in
            HStack(alignment: .top) {
                ForEach(data.indices, id: \.self) { index in
                    Candlestick(data: data[index])
                        .offset(x: 0, y: calculateOffsetOfYPosition(proxy.size, data: data[index]))
                }
            }
        }
    }
    
    func calculateOffsetOfYPosition(_ size: CGSize, data: CandleStickData) -> CGFloat {
        let offsetToBoundary = size.height - (data.highestTradedPrice - data.lowestTradedPrice)
        let offsetToValue = offsetToBoundary - data.highestTradedPrice
        return offsetToValue
    }
}

struct CandlestickChart_Previews: PreviewProvider {
    static var previews: some View {
        CandlestickChart()
            .previewLayout(.fixed(width: 500.0, height: 500.0))
        
    }
}
