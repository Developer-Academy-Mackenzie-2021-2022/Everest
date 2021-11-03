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
    
    var escala: Double
    
    var body: some View {
        VStack{
            Text(showNumero ? String(quadrado.valor):"")
                .frame(width: quadrado.largura, height: quadrado.altura)
        }
        .background(quadrado.cor
                        .brightness(((quadrado.valor/escala) - 1) * (-1)-0.3)
        )
}
    
struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        
        SquareView(quadrado: ModelSquare(valor: 10.0, cor: Color.red, largura: 100.0, altura: 100.0), showNumero: true, escala: 10.0)
            
        }
    }
}
