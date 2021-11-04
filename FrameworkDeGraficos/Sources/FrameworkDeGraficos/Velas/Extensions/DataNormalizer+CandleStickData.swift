//
//  File.swift
//  
//
//  Created by Gabriel Ferreira de Carvalho on 29/10/21.
//

import SwiftUI

extension DataNormalizer {
    
    func normalizeCandlestickData(_ data: [CandleStickData], height: CGFloat, increaseColor: Color, decreaseColor: Color) -> [CandleStickDrawData] {
        let drawData = data.map { CandleStickDrawData(data: $0, increaseColor: increaseColor, decreaseColor: decreaseColor) }
        let (min,max) = calculateDataBoundaries(data: drawData)
        let normalizedByMinValue = normalizeCandlestickDataByMinValue(data: drawData, minValue: min)
        let scaleFactor = findScaleFactor(height, max)
        let normalizedByScaleValue = normalizeCandlestickDataByScaleFactor(data: normalizedByMinValue, scaleFactor: scaleFactor)
        return invertValuesOnYAxis(data: normalizedByScaleValue, height: height)
        
    }
    
    func calculateDataBoundaries(data: [CandleStickDrawData]) -> (CGFloat, CGFloat) {
        guard
            let max = data.map(\.highStroke).max(),
            let min = data.map(\.lowStroke).min()
        else {
            preconditionFailure("empty list")
        }
        
        return (min, max)
    }
    
    func normalizeCandlestickDataByMinValue(data: [CandleStickDrawData], minValue: CGFloat) -> [CandleStickDrawData] {
        var drawData: [CandleStickDrawData] = []
        for datum in data {
            drawData.append(.init(highStroke: normalizeByDataMinValue(datum.highStroke, minValue: minValue),
                                  lowStroke: normalizeByDataMinValue(datum.lowStroke, minValue: minValue),
                                  highBody: normalizeByDataMinValue(datum.highBody, minValue: minValue),
                                  lowBody: normalizeByDataMinValue(datum.lowBody, minValue: minValue),
                                  color: datum.color))
        }
        return drawData
    }
    
    func normalizeCandlestickDataByScaleFactor(data: [CandleStickDrawData], scaleFactor: CGFloat) -> [CandleStickDrawData] {
        var drawData: [CandleStickDrawData] = []
        for datum in data {
            drawData.append(.init(highStroke: datum.highStroke * scaleFactor,
                                  lowStroke: datum.lowStroke * scaleFactor,
                                  highBody: datum.highBody * scaleFactor,
                                  lowBody: datum.lowBody * scaleFactor,
                                  color: datum.color))
        }
        return drawData
    }
    
    func invertValuesOnYAxis(data: [CandleStickDrawData], height: CGFloat) -> [CandleStickDrawData] {
        var drawData: [CandleStickDrawData] = []
        for datum in data {
            drawData.append(.init(highStroke: height - datum.highStroke,
                                  lowStroke: height - datum.lowStroke,
                                  highBody: height - datum.highBody,
                                  lowBody: height - datum.lowBody,
                                  color: datum.color))
        }
        return drawData
    }
}
