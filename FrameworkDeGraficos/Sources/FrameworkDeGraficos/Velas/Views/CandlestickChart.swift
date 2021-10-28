//
//  SwiftUIView.swift
//  
//
//  Created by Gabriel Ferreira de Carvalho on 28/10/21.
//

import SwiftUI

public struct CandlestickChart: View {
    let data: CandleStickDrawData
    let bodyWidth: CGFloat = 30
    let strokeWidth: CGFloat = 3
    
    private let coordinateCalculator: CoordinateCalculator = .init()
    
    public init(data: CandleStickData) {
        self.data = .init(data: data)
    }
    
    public var body: some View {
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
        }.frame(width: bodyWidth + 10, height: data.highStroke - data.lowStroke)
    }
    
    private func bodySize(for size: CGSize) -> CGSize {
        CGSize(width: bodyWidth, height: data.bodyHeight)
    }
    
    private func bodyPoint(for size: CGSize) -> CGPoint {
        let x: CGFloat = coordinateCalculator.middlePoint(for: size).x - bodyWidth/2
        let y: CGFloat = coordinateCalculator.topMiddlePoint(for: size).y + (data.bodyOriginY)
        
        return CGPoint(x: x, y: y)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CandlestickChart(data: CandleStickData(highestTradedPrice: 200,
                                               lowestTradedPrice: 100,
                                               openTradedPrice: 170,
                                               closeTradedPrice: 150))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/))
    }
}


