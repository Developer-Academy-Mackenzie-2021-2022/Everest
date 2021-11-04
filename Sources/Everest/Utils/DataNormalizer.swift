//
//  File.swift
//  
//
//  Created by Gabriel Ferreira de Carvalho on 29/10/21.
//

import CoreGraphics

// arredonda valores
private extension CGFloat {
    func rounded(toPlaces places:Int) -> CGFloat {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

struct DataNormalizer {
    
    static let shared = DataNormalizer()
    
    /**
    Recebe uma lista de dados e retorna seu máximo e minimo
    - Parameters:
      - data: Dados de pontos
     - Returns: (min, max)
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
    
    /**
    Recebe cada valor, multiplica pelo fator de escala e retorna o valor normalizado
     - parameters:
        - value: Valor de x ou y
        - scaleFactor: Fator de escala
     - Returns: value * scaleFactor
     */
    func normalizeByScaleFactor(_ value: CGFloat, scaleFactor: CGFloat) -> CGFloat {
        return value * scaleFactor
    }

    /**
    Recebe cada valor e faz a normalização com o valor mínimo, de modo que o mínimo fique zerado
     - parameters:
        - value: Valor de x ou y
        - minValue: menor valor de x ou y
     - Returns: value + decreaseRate
     */
    func normalizeByDataMinValue(_ value: CGFloat, minValue: CGFloat) -> CGFloat {
        let decreaseRate = 0 - minValue
        return value + decreaseRate
    }
    
    /**
    Acha o fator de escala
     - parameters:
        - viewAxisSize: Tamanho da view
        - maxValue: maior valor de x ou y
     - Returns: viewAxisSize / maxValue
     */
    func findScaleFactor(_ viewAxisSize: CGFloat, _ maxValue: CGFloat) -> CGFloat {
        return viewAxisSize / maxValue
    }

    /**
    Normaliza os dados do eixo X chamando as funções anteriores
     - parameters:
        - data: Array de pontos X
        - width: Largura da view
     - Returns: Pontos X normalizados
     */
    func normalizeXAxisData(_ data: [CGFloat], width: CGFloat) -> [CGFloat] {
        let (min, max) = calculateDataBoundaries(data: data)
        let normalizedBy0Data = data.map { normalizeByDataMinValue($0, minValue: min) }
        let scaleFactor = findScaleFactor(width, max-min)
        let normalizedByScaleFactor = normalizedBy0Data.map { normalizeByScaleFactor($0, scaleFactor: scaleFactor) }
        return normalizedByScaleFactor
    }
    
    /**
    Normaliza os dados do eixo Y  e inverte o gráfico (considerando que o zero da view é no topo, e o zero do gráfico embaixo)
     - parameters:
        - data: Array de pontos Y
        - height: Altura da view
     - Returns: Pontos Y normalizados
     */
    func normalizeYAxisData(_ data: [CGFloat], height: CGFloat) -> [CGFloat] {
        return normalizeXAxisData(data, width: height).map { height - $0 }
    }

    /**
     Função de normalização para se os dados são dados em array de pares de pontos X Y
     - parameters:
        - data: Array de pares de pontos
        - viewSize: Tamanho da view
     - Returns: Pares de pontos normalizados
     */
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
