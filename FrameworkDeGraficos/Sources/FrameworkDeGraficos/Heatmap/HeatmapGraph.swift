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
                    let screenWidth = UIScreen.main.bounds.size.width * 0.7
                    
                        ForEach(matriz[i], id:\.self){
                            elemento in
                            GeometryReader { geometry in
                          SquareView(
                            quadrado: ModelSquare(valor: elemento, cor: Color.red, largura: screenWidth/Double(matriz.count), altura: screenWidth/Double(matriz.count)),
                                showNumero: showNumero, escala: escala)

                            }.frame(width: screenWidth/Double(matriz.count), height: screenWidth/Double(matriz.count))
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
        HeatmapGraph(matriz: [[156,270,398], [502,600,788.9], [990,104,1367]], showNumero: true)
    }
}
