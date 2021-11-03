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
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(lineTitle)
    }
}
