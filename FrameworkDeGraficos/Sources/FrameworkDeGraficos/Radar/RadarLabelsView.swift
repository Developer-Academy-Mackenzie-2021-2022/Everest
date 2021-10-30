//
//  SwiftUIView.swift
//  
//
//  Created by Thais da Silva Bras on 29/10/21.
//

import SwiftUI
import CoreGraphics

struct RadarLabelsView: View {
    var sides: Int
    
    var body: some View {
        ZStack{
            ForEach((0..<sides), id: \.self){
                
            }
        }
    }
    
    private func getLabelPosition(side: Int) -> CGPoint {
        let center: CGPoint = CGPoint(x: rect.width/2, y: rect.height/2)
        let angle: Double = 2.0 * Double.pi / Double(sides)
        for i in 0..<sides {
            let x: Double = cos(Double(i) * angle) * (size)
            let y: Double = sin(Double(i) * angle) * (size)
            let point = CGPoint(x: x+center.x, y: y+center.y)
            chartPoints.append(point)
        }
    }
}

struct RadarLabelsView_Previews: PreviewProvider {
    static var previews: some View {
        RadarLabelsView()
    }
}
