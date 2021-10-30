//
//  SwiftUIView.swift
//  
//
//  Created by Thais da Silva Bras on 29/10/21.
//

import SwiftUI

struct RadarGridView: View {
    var gridSize: Int
    var sides: Int
    var size: Double
    
    var body: some View {
        ZStack{
            ForEach((1...gridSize), id: \.self){
                RegularPolygon(sides: sides, size: size*Double($0)/Double(gridSize))
                    .stroke()
                    .rotationEffect(Angle(degrees: -90))
            }
//            ForEach((0..<sides), id: \.self){
//                let center: CGPoint = CGPoint(x: 50, y: 100)
//                let angle: Double = 2.0 * Double.pi / Double(sides)
//                let x: Double = cos(Double($0) * angle) * (data[i]*rect.maxX)
//                let y: Double = sin(Double($0) * angle) * (data[i]*rect.maxY)
//                Text("Gkzinho")
//                    .font(.title)
//                    .position(x: x+center.x, y: y+center.y)
//            }
        }
    }
}

struct RadarGridView_Previews: PreviewProvider {
    static var previews: some View {
        RadarGridView(gridSize: 4, sides: 5, size: 100)
    }
}
