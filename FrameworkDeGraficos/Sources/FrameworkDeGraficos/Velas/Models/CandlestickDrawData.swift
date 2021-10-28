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
    
    var bodyOriginY: CGFloat { highStroke - highBody }
    var bodyHeight: CGFloat { highBody - lowBody }
    
    internal init(data: CandleStickData) {
        highStroke = data.highestTradedPrice
        lowStroke = data.lowestTradedPrice
        
        if data.openTradedPrice >= data.closeTradedPrice {
            highBody = data.openTradedPrice
            lowBody = data.closeTradedPrice
            color = .red
        } else {
            highBody = data.closeTradedPrice
            lowBody = data.openTradedPrice
            color = .green
        }
    }
}
