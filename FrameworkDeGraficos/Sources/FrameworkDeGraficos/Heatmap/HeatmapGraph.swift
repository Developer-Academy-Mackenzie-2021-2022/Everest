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
    var corMaisForte:Color = .init(red: 202, green: 9, blue: 0)
    var corMaisFraca:Color = .init(red: 254, green: 237, blue: 225)
    
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

                    }
                }
            }
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.init(hue: 0, saturation: 1, lightness: 0.347, opacity: 1),.init(hue: 0.06944444444, saturation: 0.935, lightness: 0.939, opacity: 1)]), startPoint: .top, endPoint: .bottom))
                .frame(width: 50, height: 320)
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
extension Color {
    init(hue: Double, saturation: Double, lightness: Double, opacity: Double) {
        precondition(0...1 ~= hue &&
                     0...1 ~= saturation &&
                     0...1 ~= lightness &&
                     0...1 ~= opacity, "input range is out of range 0...1")
        
        //From HSL TO HSB ---------
        var newSaturation: Double = 0.0
        
        let brightness = lightness + saturation * min(lightness, 1-lightness)
        
        if brightness == 0 { newSaturation = 0.0 }
        else {
            newSaturation = 2 * (1 - lightness / brightness)
        }
        //---------
        
        self.init(hue: hue, saturation: newSaturation, brightness: brightness, opacity: opacity)
    }
}

struct HeatmapGraph_Previews: PreviewProvider {
    static var previews: some View {
        HeatmapGraph(matriz: [[56,27,36], [54,100,75], [100,90,73]], showNumero: true)
    }
}
