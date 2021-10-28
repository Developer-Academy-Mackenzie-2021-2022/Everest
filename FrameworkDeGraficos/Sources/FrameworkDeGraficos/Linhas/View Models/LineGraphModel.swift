//
//  File.swift
//  
//
//  Created by Marcos Chevis on 28/10/21.
//

import Foundation

class LineGraphModel: ObservableObject {
    
    var minPoint: CGPoint = CGPoint(x: Double.greatestFiniteMagnitude, y: Double.greatestFiniteMagnitude)
    var maxPoint: CGPoint = CGPoint(x: -Double.greatestFiniteMagnitude, y: -Double.greatestFiniteMagnitude)
    var conversionFactor: CGPoint?
    var positiveModifier: CGPoint?
    
    internal init() {
        
    }
    
    // Acha o maior x, maior y, menor x e menor y
    private func updateMinMax(lines: [Line]) {
        
        for line in lines {
            
            for point in line.points {
                if point.x < self.minPoint.x {
                    self.minPoint.x = point.x
                }
                if point.x > self.maxPoint.x {
                    self.maxPoint.x = point.x
                }
                
                if point.y < self.minPoint.y {
                    self.minPoint.y = point.y
                }
                if point.y > self.maxPoint.y {
                    self.maxPoint.y = point.y
                }
                
                
                
            }
            
            
            
        }
        
    }
    
    //acha o fator de conversao
    private func updateConvertionFactor(viewSize: CGSize) {
        let axisSize = CGSize(width: abs(maxPoint.x - minPoint.x), height: abs(maxPoint.y - minPoint.y))
    }
    
    
    
    // Acha o modificador para deixar o gráfico no primeiro quadrante
    private func updatePositiveModifier() {
        positiveModifier = CGPoint(x: abs(minPoint.x), y: abs(minPoint.y))
        
    }
    
    
    
    
    internal func updateSpace(lines: [Line], viewSize: CGSize) {
        updateMinMax(lines: lines)
        updatePositiveModifier()
        updateConvertionFactor(viewSize: viewSize)
    }
    
    internal func convertGraphSpaceToViewSpace(point: CGPoint) -> CGPoint {
        //precisa de:
        //quanto precisa somar pra tudo ficar positivo
        //fator de conversao
        //multiplica por -1 o y
        
        return CGPoint(x: 10, y: 10)
    }
}
