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
        let normalizador = (matriz.count>matriz[0].count ? matriz.count+1:matriz[0].count+1)
        let screenWidth = UIScreen.main.bounds.size.width * 0.8
        
        
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
                .frame(width:(screenWidth*(12/11)) , height:screenWidth/(Double(normalizador)*2))
        
        VStack{

            ForEach((0 ..<  matriz.count), id:\.self){ i in
                
                HStack(){
                    Text(legendaColuna[i])
                        .frame(width: screenWidth/Double(normalizador), height: screenWidth/Double(normalizador))
                    
                    ForEach((0 ..< matriz[i].count), id:\.self){ j in
                        
                            GeometryReader { geometry in
                          SquareView(
                            quadrado: ModelSquare(valor: matriz[i][j], cor: Color.red, largura: screenWidth/Double(normalizador), altura: screenWidth/Double(normalizador)),showNumero: showNumero, escala: escala)

                            }.frame(width: screenWidth/Double(normalizador), height: screenWidth/Double(normalizador))
                        }
                    }

                }
                
            HStack{
                
                Text("").frame(width: screenWidth/Double(normalizador), height: screenWidth/Double(normalizador))
                
                ForEach(legendaLinha, id:\.self){ legenda in
                    Text(legenda)
                        .rotationEffect(Angle(degrees: -90))
                        .frame(width: screenWidth/Double(normalizador), height: screenWidth/Double(normalizador))

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
        HeatmapGraph(matriz: [[30,15,21,10], [28,2,14,15], [10,3,8,11]], showNumero: true, legendaColuna: ["roberto","Renatinho","Claudio","João"],legendaLinha: ["Cachorro","gato","peixe","Avestrus"])
    }
}
