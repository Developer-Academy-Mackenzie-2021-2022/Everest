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
    var barColor: Color = .primary
    var labelColor: Color = .primary
    var increaseCandleColor: Color = .green
    var decreaseCandleColor: Color = .red
    
    public init(data: [CandleStickData], xLabels: [String], barColor: Color = Color.primary, labelColor: Color = Color.primary, increaseCandleColor: Color = Color(red: 0x4D/255, green: 0xA8/255, blue: 0x8D/255) , decreaseCandleColor: Color = Color(red: 0xF5/255, green: 0x45/255, blue: 0x4F/255)) {
        self.data = data
        self.xLabels = xLabels
        self.barColor = barColor
        self.labelColor = labelColor
        self.increaseCandleColor = increaseCandleColor
        self.decreaseCandleColor = decreaseCandleColor
    }
    
    private var yAxisLabels: [String] {
        let highest = data
            .map(\.highestTradedPrice)
            .max() ?? 0

        let factor = (highest/Double(numberOfYLines)).rounded()
        
        return Array(1...numberOfYLines).map { "\($0 * Int(factor))" }.reversed()
    }

    
    public var body: some View {
        CandleStickAxis(xLabels: xLabels, yLabels: yAxisLabels, barColor: barColor, labelColor: labelColor) {
            Candlesticks(data: data, increaseColor: increaseCandleColor, decreaseColor: decreaseCandleColor)
        }
    }
}

struct CandleSticksChart_Previews: PreviewProvider {
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
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/400.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/400.0/*@END_MENU_TOKEN@*/))
    }
}
