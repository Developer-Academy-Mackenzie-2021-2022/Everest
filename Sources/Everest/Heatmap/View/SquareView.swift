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
                .font(.system(size: 0.3*quadrado.largura))
        }
        .background(Color.init(hue: 0, saturation: 1, lightness: conversaoDeParametros(escala: escala, valor: quadrado.valor), opacity: 1))
        
}
    func conversaoDeParametros(escala:Double, valor:Double)->Double{
        return ((valor/escala*0.4)-0.7)*(-1.0)
    }
    
struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        
        SquareView(quadrado: ModelSquare(valor: 1000.0, cor: Color.red, largura: 50.0, altura: 50.0), showNumero: true, escala: 100000.0)
            
        }
    }
}
