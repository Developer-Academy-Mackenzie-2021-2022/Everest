//
//  File.swift
//  
//
//  Created by Gabriel Ferreira de Carvalho on 28/10/21.
//

import Foundation

public struct CandleStickData: Codable {
    let highestTradedPrice: Double
    let lowestTradedPrice: Double
    let openTradedPrice: Double
    let closeTradedPrice: Double
}
