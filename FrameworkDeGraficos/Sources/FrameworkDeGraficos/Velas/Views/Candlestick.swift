//
//  SwiftUIView.swift
//  
//
//  Created by Gabriel Ferreira de Carvalho on 28/10/21.
//

import SwiftUI

struct Candlestick: View {
    let data: CandleStickDrawData
    let bodyWidth: CGFloat = 30
    let strokeWidth: CGFloat = 3
    
    private let coordinateCalculator: CoordinateCalculator = .init()
    
    init(data: CandleStickDrawData) {
        self.data = data
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Path { path in
                    path.move(to: coordinateCalculator.topMiddlePoint(for: proxy.size))
                    path.addLine(to: coordinateCalculator.bottomMiddlePoint(for: proxy.size))
                    
                }.stroke(data.color, lineWidth: strokeWidth)
                Path { path in
                    path.addRect(CGRect(origin: bodyPoint(for: proxy.size),
                                        size: bodySize(for: proxy.size)))
                }.fill(data.color)
            }
        }.frame(width: bodyWidth, height: data.lowStroke - data.highStroke)
    }
    
    private func bodySize(for size: CGSize) -> CGSize {
        CGSize(width: bodyWidth, height: data.bodyHeight)
    }
    
    private func bodyPoint(for size: CGSize) -> CGPoint {
        let x: CGFloat = coordinateCalculator.middlePoint(for: size).x - bodyWidth/2
        let y: CGFloat = data.bodyOriginY
        
        return CGPoint(x: x, y: y)
    }
}

struct Candlestick_Previews: PreviewProvider {
    static var previews: some View {
        Candlestick(data: CandleStickDrawData(highStroke: 20,
                                              lowStroke: 90,
                                              highBody: 30,
                                              lowBody: 50,
                                              color: .green))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/))
    }
}


