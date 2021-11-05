//
//  HistogramView.swift
//
//
//  Created by Carolina Ortega on 03/11/21.
//

import CoreGraphics
import SwiftUI


public struct Histograma: View {
    @State private var data: [CGFloat]
    private var colors: [Color] = []
    private var labelX: String
    private var labelY: String
    
    
    public init(data: [CGFloat], colors: [Color], labelX: String, labelY: String) {
        self.data = data
        self.colors = colors
        self.labelX = labelX
        self.labelY = labelY
    }
    
    
    public var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width - 40
            let height = geometry.size.height / 2
            let centerY = height
            let maxValue = self.data.max() ?? 0         // Valor máximo nos dados
            let minValue = self.data.min() ?? 0         // Valor mínimo nos dados
            let interval = 2.0                          // Intervalo do eixo X
            let max: CGFloat = 200.0                    // Valor máximo
            let scale = max/(maxValue-minValue)         // Escala
            
            ZStack (alignment: .center) {
                ZStack (alignment: .center) {
                    
                    // Parâmetros eixo X e Y
                    Text("**\(self.labelY)**")
                        .position(x: 90, y: centerY-max-85)
                        .font(.subheadline)
                    
                    Text("**\(self.labelX)**")
                        .position(x: width-25, y: centerY+40)
                        .font(.subheadline)
                    
                    // Linhas eixo X e Y
                    Path { path in
                        path.move(to: CGPoint(x: 50, y: centerY-max-70))
                        
                        path.addLine(to: CGPoint(x: 50, y: centerY-7))
                        
                        path.addLine(to: CGPoint(x: width, y: centerY-7))
                    }.stroke(Color.secondary, lineWidth: 3)
                    
                }.offset(y: 60)
                
                // Criação do gráfico
                VStack {
                    ZStack{
                        
                        // Colocando as barras
                        HStack(alignment: .bottom, spacing: 0.5) {
                            ForEach(0..<self.data.count) { x in
                                Bar(color: self.colors[x], value: scale*self.data[x], width: (width - 67) / CGFloat(self.data.count))
                            }
                        }.padding(.bottom, 128)
                        
                        // Labels (valores) eixo X e Y
                        let valor = Float(self.data.count)
                        ForEach(0..<Int(valor)+1) { i in
                            // Eixo X
                            let auxX = CGFloat(i)*CGFloat((width+40-(max/2))/CGFloat(valor))+CGFloat(50)
                            let value = Float(interval)*Float(i)
                            
                            Text(String(format:"%.0f", value))
                                .position(x: CGFloat(auxX), y: centerY + CGFloat(75))
                                .font(.subheadline)
                            
                            // Eixo Y
                            let auxY = centerY-CGFloat(i)*CGFloat((max)/CGFloat(valor))
                            let value = Float(minValue)+(Float(maxValue-minValue)/valor)*Float(i)
                            
                            Text(String(format:"%.0f", value))
                                .position(x:50-20, y:CGFloat(auxY)+25)
                                .font(.subheadline)
                        }
                    }
                }
            }
        }
    }
}


// Preview do Gráfico com um exemplo:

/*
struct Histograma_Previews: PreviewProvider {
    static var previews: some View {
        Histograma(data: [50, 30, 40, 70, 10, 80, 60],
                   colors: [Color(red: 245/255, green: 69/255,  blue: 79/255),   // Vermelho
                            Color(red: 239/255, green: 114/255, blue: 65/255),   // Laranja escuro
                            Color(red: 244/255, green: 150/255, blue: 63/255),   // Laranja claro
                            Color(red: 247/255, green: 197/255, blue: 99/255),   // Amarelo
                            Color(red: 146/255, green: 188/255, blue: 117/255),  // Verde
                            Color(red: 77/255,  green: 168/255, blue: 141/255),  // Verde água
                            Color(red: 89/255,  green: 119/255, blue: 142/255)   // Azul
                           ],
                   labelX: "Massa solar", labelY: "Número de estrelas"
        )
    }
}
*/
