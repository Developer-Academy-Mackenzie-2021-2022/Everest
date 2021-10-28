//
//  File.swift
//  
//
//  Created by Marcos Chevis on 28/10/21.
//

import Foundation

class LineGraphModel: ObservableObject {
    
    var minPoint: CGPoint?
    var maxPoint: CGPoint?
    var conversionFactor: CGPoint?
    var positiveModifier: CGPoint?
    
    internal init() {
        
    }
    
    
    private func updateMinMax(lines: [Line]) {
        //precisa de:
            //lines
        
//        for ..... {
//
//        }
        
        self.minPoint = CGPoint(x: 10, y: 10)
        self.maxPoint = CGPoint(x: 20, y: 20)
    }
    
    //acha o fator de conversao
    private func updateConvertionFactor(viewSize: CGSize) {
        //precisa de:
            //tamanho do eixo (max-min)
            //tamanho da view
    }
    
    //

    
    private func updatePositiveModifier() {
        //precisa de:
            //ponto mínimo
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
