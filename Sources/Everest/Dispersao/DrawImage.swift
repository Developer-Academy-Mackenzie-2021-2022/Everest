//
//  File.swift
//  
//
//  Created by Beatriz Duque on 03/11/21.
//

import Foundation
import SwiftUI

public struct DrawImage: View {
    private var points: [CGPoint]
    private var scaleX: CGFloat
    private var scaleY: CGFloat
    private var centerY: CGFloat
    private var minx: CGFloat
    private var miny: CGFloat
    public var color: Color
    
    
    public init (points: [CGPoint], scaleX: CGFloat, scaleY: CGFloat, centerY: CGFloat, color: Color, minx: CGFloat, miny: CGFloat) {
        self.points = points
        self.scaleX = scaleX
        self.scaleY = scaleY
        self.centerY = centerY
        self.color = color
        
        self.minx = minx
        self.miny = miny
        
        
    }
    
    public var body: some View {
        ZStack {
            ForEach (0..<points.count, id: \.self) { i in
                VStack {
                    Circle()
                        .fill(color)
                        .frame(width: 10, height: 10, alignment: .center)
                        .position(x: CGFloat((points[i].x - minx)*scaleX+50), y: centerY-CGFloat(points[i].y-miny)*scaleY)
                }
            }
        }
    }
}
