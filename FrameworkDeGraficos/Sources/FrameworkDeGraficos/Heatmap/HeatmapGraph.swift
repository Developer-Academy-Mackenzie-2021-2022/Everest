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
        HStack{
            ForEach((0 ..<  matriz.count), id:\.self){ i in
                
                VStack{
                    ForEach(matriz[i], id:\.self){
                        matriz in

                      SquareView(
                            quadrado: ModelSquare(valor: matriz, cor: Color.red, largura: 100.0, altura: 100.0),
                            showNumero: showNumero)

//                        Text(String(format: "%.2f", matriz))

                    }
                }
            }
        }
    }
}

struct HeatmapGraph_Previews: PreviewProvider {
    static var previews: some View {
        HeatmapGraph(matriz: [[4,9,1], [1,1,1], [1,1,1]], showNumero: true)
    }
}
