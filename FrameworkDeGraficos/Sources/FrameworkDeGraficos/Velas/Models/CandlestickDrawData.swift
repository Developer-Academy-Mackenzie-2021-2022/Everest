//
//  File.swift
//  
//
//  Created by Gabriel Ferreira de Carvalho on 28/10/21.
//

import SwiftUI

internal struct CandleStickDrawData {
    let highStroke: CGFloat
    let lowStroke: CGFloat
    let highBody: CGFloat
    let lowBody: CGFloat
    let color: Color
    
    var bodyOriginY: CGFloat { highBody - highStroke }
    var bodyHeight: CGFloat { lowBody - highBody }
    
    internal init(data: CandleStickData, increaseColor: Color, decreaseColor: Color) {
        highStroke = data.highestTradedPrice
        lowStroke = data.lowestTradedPrice
        
        if data.openTradedPrice >= data.closeTradedPrice {
            highBody = data.openTradedPrice
            lowBody = data.closeTradedPrice
            color = decreaseColor
        } else {
            highBody = data.closeTradedPrice
            lowBody = data.openTradedPrice
            color = increaseColor
        }
    }
    
    internal init(highStroke: CGFloat, lowStroke: CGFloat, highBody: CGFloat, lowBody: CGFloat, color: Color) {
        self.highStroke = highStroke
        self.lowStroke = lowStroke
        self.highBody = highBody
        self.lowBody = lowBody
        self.color = color
    }
}
