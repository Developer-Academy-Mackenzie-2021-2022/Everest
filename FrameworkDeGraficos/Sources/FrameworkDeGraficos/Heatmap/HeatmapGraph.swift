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
    var legendaColuna:[String]
    var legendaLinha:[String]
    

    
    var body: some View {
        let escala = maiorNumeroDaMatriz(matriz: matriz)
        let screenWidth = UIScreen.main.bounds.size.width * 0.6
        
        
        VStack{
            HStack{

                Text(String(0.0))
                    .padding(.leading)
                Spacer()
                Text(String(escala))
                    .padding(.trailing)
                
            }
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.init(hue: 0, saturation: 1, lightness: 0.3, opacity: 1),.init(hue: 0, saturation: 1, lightness: 0.5, opacity: 1),.init(hue: 0, saturation: 1, lightness: 0.7, opacity: 1)]), startPoint: .trailing, endPoint: .leading))
                .frame(width:(screenWidth*(3/2)) , height:screenWidth/(Double(matriz.count)*2))
        
        HStack{
            VStack{
                ForEach(legendaLinha, id:\.self){ legenda in
                    Text(legenda)
                        .frame(width: screenWidth/Double(matriz.count), height: screenWidth/Double(matriz[0].count))

                }
                Text("").frame(width: screenWidth/Double(matriz.count), height: screenWidth/Double(matriz[0].count))
            }
            
            ForEach((0 ..<  matriz.count), id:\.self){ i in
                
                VStack(){
                    
                    ForEach((0 ..< matriz[i].count), id:\.self){ j in
                        
                            GeometryReader { geometry in
                          SquareView(
                            quadrado: ModelSquare(valor: matriz[i][j], cor: Color.red, largura: screenWidth/Double(matriz.count), altura: screenWidth/Double(matriz.count)),showNumero: showNumero, escala: escala)

                            }.frame(width: screenWidth/Double(matriz.count), height: screenWidth/Double(matriz[i].count))
                    }
                    
                    Text(legendaColuna[i]).rotationEffect(Angle(degrees: -90))
                        .frame(width: screenWidth/Double(matriz.count), height: screenWidth/Double(matriz[i].count))
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
        HeatmapGraph(matriz: [[30,15,21], [14,8,29], [25,5,21]], showNumero: true, legendaColuna: ["roberto","Renatinho","Claudio"],legendaLinha: ["Cachorro","gato","peixe"])
    }
}
