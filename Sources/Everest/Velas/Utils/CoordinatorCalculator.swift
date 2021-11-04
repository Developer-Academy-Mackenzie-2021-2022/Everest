//
//  File.swift
//  
//
//  Created by Gabriel Ferreira de Carvalho on 28/10/21.
//

import CoreGraphics

struct CoordinateCalculator {
    
    func middlePoint(for size: CGSize) -> CGPoint {
        CGPoint(x: size.width/2, y: size.height/2)
    }
    
    func topMiddlePoint(for size: CGSize) -> CGPoint {
        CGPoint(x: size.width/2, y: 0)
    }
    
    func bottomMiddlePoint(for size: CGSize) -> CGPoint {
        CGPoint(x: size.width/2, y: size.height)
    }
}
