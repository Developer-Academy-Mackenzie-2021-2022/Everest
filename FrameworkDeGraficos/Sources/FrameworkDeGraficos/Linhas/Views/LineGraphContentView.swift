//
//  SwiftUIView.swift
//  
//
//  Created by Marcos Chevis on 28/10/21.
//

import SwiftUI

struct LineGraphContentView: View {
    
    let lines: [Line]
    
    @StateObject
    var lineGraphModel = LineGraphModel()
    
    internal init(lines: [Line]) {
        self.lines = lines
    }
    
    var body: some View {
        
        GeometryReader { proxy in
            ZStack {
                Text("oi :)")
                
                //as coisa que a gente desenha
            }.onAppear {
                lineGraphModel.updateSpace(lines: lines, viewSize: proxy.size)
            }
        }
    }
}

struct SwiftUIView_Previews1: PreviewProvider {
    static var previews: some View {
        LineGraphContentView(lines: [Line(points: [CGPoint(x: 10, y: 10)])])
            .previewLayout(.fixed(width: 200.0, height: 200.0))
    }
}
