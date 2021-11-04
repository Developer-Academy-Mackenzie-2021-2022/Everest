//
//  File.swift
//  
//
//  Created by Marcos Chevis on 28/10/21.
//

import Foundation
import SwiftUI

public struct Line: Hashable {
    public var points: [CGPoint]
    public var lineTitle: String
    public var color: Color
    public var lineWidth: CGFloat
    
    public init(points: [CGPoint], lineTitle: String, color: Color = Color.red, lineWidth: CGFloat = 3) {
        self.points = points
        self.lineTitle = lineTitle
        self.lineWidth = lineWidth
        self.color = color
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(lineTitle)
    }
}
