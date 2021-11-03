//
//  SwiftUIView.swift
//  
//
//  Created by Gabriel Ferreira de Carvalho on 03/11/21.
//

import SwiftUI

public struct CandleSticksChart: View {
    let data: [CandleStickData]
    let numberOfYLines: Int = 5
    let xLabels: [String]
    
    public init(data: [CandleStickData], xLabels: [String]) {
        self.data = data
        self.xLabels = xLabels
    }
    
    private var yAxisLabels: [String] {
        let highest = data
            .map(\.highestTradedPrice)
            .max() ?? 0

        let factor = (highest/Double(numberOfYLines)).rounded()
        
        return Array(1...numberOfYLines).map { "\($0 * Int(factor))" }.reversed()
    }

    
    public var body: some View {
        CandleStickAxis(xLabels: xLabels, yLabels: yAxisLabels) {
            Candlesticks(data: data)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CandleSticksChart(data: [CandleStickData(highestTradedPrice: 200,
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
                                                    closeTradedPrice: 150)], xLabels: ["jan", "fev", "mar"])
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/400.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/400.0/*@END_MENU_TOKEN@*/))
    }
}
