//
//  SquareView.swift
//  HeatmapFramework
//
//  Created by Bianca Maciel Matos on 28/10/21.
//

import SwiftUI

struct SquareView: View {
    var quadrado: ModelSquare

    var body: some View {
        quadrado.retangulo
            .fill(quadrado.cor)
            .frame(width: quadrado.largura, height: quadrado.altura)
            .brightness(0.5)
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView(
        
            quadrado: ModelSquare(valor: 2.0, cor: Color.red, largura: 100.0, altura: 100.0)
        )
            .previewLayout(.fixed(width: 100, height: 100))
    }
}
