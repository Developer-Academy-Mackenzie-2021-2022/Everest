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
                let normalizedData = dataNormalizer.normalizeLines(lines, viewSize: proxy.size)
                ForEach(normalizedData, id: \.self) { line in
                    Path { path in
                        guard let firstPoint = line.points.first else {
                            return
                        }
                        
                        path.move(to: firstPoint)
                        
                        
                        for point in line.points {
                            path.addLine(to: point)
                        }
                        
                        
                    }
                    .stroke(line.color, lineWidth: 3)
                    
                }
                
            }
        }
    }
}

struct SwiftUIView_Previews1: PreviewProvider {

    static var previews: some View {
  
        LineGraphContentView(lines: [Line(points: [CGPoint(x: 0, y: 0), CGPoint(x: 5, y: 9), CGPoint(x: 10, y: 10)], lineTitle: "linha", color: Color.blue, lineWidth: 3), Line(points: [CGPoint(x: 0, y: 0), CGPoint(x: 30, y: 20)], lineTitle: "linha", color: Color.red, lineWidth: 1)])
            .previewLayout(.fixed(width: 200.0, height: 200.0))
    }
}
