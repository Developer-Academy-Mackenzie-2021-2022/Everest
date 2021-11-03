//
//  SwiftUIView.swift
//  
//
//  Created by Marcos Chevis on 28/10/21.
//

import SwiftUI

struct LineGraphContentView: View {
    
    var lines: [Line]
    
    var dataNormalizer = DataNormalizer()
    
    internal init(lines: [Line]) {
        self.lines = lines
    }
    
    var body: some View {
        
        GeometryReader { proxy in
            ZStack {
                
                ForEach(lines, id: \.self) { line in
                     
                    let normalizedLine = dataNormalizer.normalizePoints(line.points, viewSize: proxy.size)
                    Path { path in
                        guard let firstPoint = normalizedLine.first else {
                            return
                        }
                        
                        path.move(to: firstPoint)
                        
                        
                        for point in normalizedLine {
                            path.addLine(to: point)
                        }
                        
                        
                    }
                    .stroke(Color.red, lineWidth: 3)
                    
                }
                
            }
        }
    }
}

struct SwiftUIView_Previews1: PreviewProvider {

    static var previews: some View {
  
        LineGraphContentView(lines: [Line(points: [CGPoint(x: 0, y: 0), CGPoint(x: 5, y: 9), CGPoint(x: 10, y: 10)], lineTitle: "linha", color: Color.blue, lineWidth: 3), Line(points: [CGPoint(x: 0, y: 0), CGPoint(x: 20, y: 20)], lineTitle: "linha", color: Color.red, lineWidth: 1)])
            .previewLayout(.fixed(width: 200.0, height: 200.0))
    }
}
