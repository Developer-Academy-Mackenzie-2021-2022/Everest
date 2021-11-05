//
//  File.swift
//  
//
//  Created by Gabriel Ferreira de Carvalho on 28/10/21.
//

import Foundation

public struct CandleStickData: Codable, Hashable {
    let highestTradedPrice: Double
    let lowestTradedPrice: Double
    let openTradedPrice: Double
    let closeTradedPrice: Double
    
    public init(highestTradedPrice: Double, lowestTradedPrice: Double, openTradedPrice: Double, closeTradedPrice: Double) {
        self.highestTradedPrice = highestTradedPrice
        self.lowestTradedPrice = lowestTradedPrice
        self.openTradedPrice = openTradedPrice
        self.closeTradedPrice = closeTradedPrice
    }
}
