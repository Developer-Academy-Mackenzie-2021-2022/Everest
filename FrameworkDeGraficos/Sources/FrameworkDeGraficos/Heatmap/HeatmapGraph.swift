//
//  TabelaView.swift
//  HeatmapFramework
//
//  Created by Bianca Maciel Matos on 28/10/21.
//

import SwiftUI

struct HeatmapGraph: View {
    
    var matriz: [[Double]]
    var showNumero: Bool
    
    var body: some View {
        let escala = maiorNumeroDaMatriz(matriz: matriz)
        HStack{
            ForEach((0 ..<  matriz.count), id:\.self){ i in
                
                VStack{
                    ForEach(matriz[i], id:\.self){
                        matriz in

                      SquareView(
                            quadrado: ModelSquare(valor: matriz, cor: Color.red, largura: 100.0, altura: 100.0),
                            showNumero: showNumero, escala: escala)

//                        Text(String(format: "%.2f", matriz))

                    }
                }
            }
        }
    }
    
    func maiorNumeroDaMatriz(matriz: [[Double]]) -> Double {
        var maiorNumero = Double.leastNormalMagnitude
        for i in matriz{
            for j in i{
                maiorNumero = max(maiorNumero, j)
            }
        }
        return maiorNumero
    }
}


struct HeatmapGraph_Previews: PreviewProvider {
    static var previews: some View {
        HeatmapGraph(matriz: [[156,2,3], [5,600,7], [990,10,13]], showNumero: true)
    }
}
