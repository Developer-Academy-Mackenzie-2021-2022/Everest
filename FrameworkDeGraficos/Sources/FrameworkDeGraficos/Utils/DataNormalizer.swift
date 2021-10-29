//
//  File.swift
//  
//
//  Created by Gabriel Ferreira de Carvalho on 29/10/21.
//

import CoreGraphics

private extension CGFloat {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> CGFloat {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

struct DataNormalizer {
    
    static let shared = DataNormalizer()
    
    /**
    Recebe uma lista de dados e retorna seu máximo e minimo
     - parameters:
     - data - dados de pontos
     - returns: (min, max)
     */
    func calculateDataBoundaries(data: [CGFloat]) -> (CGFloat, CGFloat) {
        guard
            let min = data.min(),
            let max = data.max()
        else {
            preconditionFailure("EMPTY SEQUENCE")
        }
        
        return (min, max)
    }

    func normalizeByScaleFactor(_ value: CGFloat, scaleFactor: CGFloat) -> CGFloat {
        return value * scaleFactor
    }

    func normalizeByDataMinValue(_ value: CGFloat, minValue: CGFloat) -> CGFloat {
        let decreaseRate = 0 - minValue
        return value + decreaseRate
    }

    func findScaleFactor(_ viewAxisSize: CGFloat, _ maxValue: CGFloat) -> CGFloat {
        return viewAxisSize / maxValue
    }

    func normalizeXAxisData(_ data: [CGFloat], width: CGFloat) -> [CGFloat] {
        let (min, max) = calculateDataBoundaries(data: data)
        let normalizedBy0Data = data.map { normalizeByDataMinValue($0, minValue: min) }
        let scaleFactor = findScaleFactor(width, max-min)
        let normalizedByScaleFactor = normalizedBy0Data.map { normalizeByScaleFactor($0, scaleFactor: scaleFactor) }
        return normalizedByScaleFactor
    }

    func normalizeYAxisData(_ data: [CGFloat], height: CGFloat) -> [CGFloat] {
        return normalizeXAxisData(data, width: height).map { height - $0 }
    }

    func normalizePoints(_ data: [CGPoint], viewSize: CGSize) -> [CGPoint] {
        let xAxis = data.map(\.x)
        let yAxis = data.map(\.y)
        
        let normalizedXAxis = normalizeXAxisData(xAxis, width: viewSize.width)
        let normalizedYAxis = normalizeYAxisData(yAxis, height: viewSize.height)
        
        return Array(repeating: 0, count: normalizedXAxis.count)
            .indices
            .map { CGPoint(x: normalizedXAxis[$0], y: normalizedYAxis[$0]) }
        
    }

}
