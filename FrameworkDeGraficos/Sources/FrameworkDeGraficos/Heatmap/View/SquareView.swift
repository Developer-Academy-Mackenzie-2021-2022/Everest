//
//  SquareView.swift
//  HeatmapFramework
//
//  Created by Bianca Maciel Matos on 28/10/21.
//

import SwiftUI

struct SquareView: View {
    var quadrado: ModelSquare
    var showNumero: Bool

    var body: some View {
        VStack{
            Text(showNumero ? String(quadrado.valor):"")
            .frame(width: quadrado.largura, height: quadrado.altura)
        }
        .background(quadrado.cor
                        .brightness(0.5)
        )
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView(
            quadrado: ModelSquare(valor: 2.0, cor: Color.red, largura: 100.0, altura: 100.0),
            showNumero: true)
            .previewLayout(.fixed(width: 100, height: 100))
    }
}
