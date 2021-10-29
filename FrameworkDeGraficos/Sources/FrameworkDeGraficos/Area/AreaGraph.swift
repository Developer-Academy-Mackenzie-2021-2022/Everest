import SwiftUI

public struct AreaGraph: View {
    public var datas: [[CGFloat]]
    public var titulo: String
    public var legendas: [String]
    public var nomesEixoX: [String]
    public var colors: [Color] = [Color.red, Color.blue, Color.green]
    public var margin: CGFloat = 25
    private var maiorValor: CGFloat = 0
    public var alturaGrafico: CGFloat = 200
    
    public init(datas: [[CGFloat]] = [[10.0,100.0,15.0]], titulo: String = "Title", legendas: [String] = ["legenda"], nomeseixoX: [String] = ["0", "1", "2"]) {
        self.datas = datas
        self.titulo = titulo
        self.legendas = legendas
        self.nomesEixoX = nomeseixoX
        self.maiorValor = acharMaiorValor()
    }
    
    public var body: some View {
        VStack {
            GeometryReader { geometry in
                let width = geometry.size.width
                
                let widthSemMargem: CGFloat = width - 2*margin
                
                let centerY:CGFloat = geometry.size.height/2
                let centerX:CGFloat = width/2
                
                let quantidade: CGFloat = CGFloat(datas[0].count - 1)
                let espaco: CGFloat = widthSemMargem / quantidade
                
                let baseGrafico = centerY+self.alturaGrafico/2

                Text(titulo)
                    .font(.title)
                    .position(x: centerX, y: centerY-self.alturaGrafico)

                ForEach(0..<datas.count, id: \.self) {
                    let data = datas[$0]
                    
//                    Path { path in
//                        path.move(to: CGPoint(x: 0, y: centerY))
//                        path.addLine(to: CGPoint(x: width, y: centerY))
//
//                    }.stroke()
                    
                    Path { path in
                        path.move(to: CGPoint(x: margin, y: baseGrafico))


                        for i in 0..<data.count {
                            path.addLine(to: CGPoint(x: espaco*CGFloat(i) + margin, y: baseGrafico-convertToScale(valor: data[i])))
                            if i == data.count-1 {
                                path.addLine(to: CGPoint(x: widthSemMargem + margin, y: baseGrafico))
                            }
                        }

                    }.fill(colors[$0].opacity(0.3))

                    Path { path in

                        path.move(to: CGPoint(x: margin, y: baseGrafico-convertToScale(valor: data[0])))

                        for i in 0..<data.count {
                            path.addLine(to: CGPoint(x: espaco*CGFloat(i) + margin, y: baseGrafico-convertToScale(valor: data[i])))
                        }
                    }.stroke(colors[$0],lineWidth: 3)
                    
                    Path { path in
                        path.move(to: CGPoint(x: margin, y: baseGrafico-alturaGrafico))
                        path.addLine(to: CGPoint(x: margin, y: baseGrafico))
                        path.addLine(to: CGPoint(x: widthSemMargem + margin, y: baseGrafico))
                    }.stroke(lineWidth: 4)
                    
//                    ForEach(0..<data.count, id: \.self) {
//                        Text(String(format: "%.2f", data[$0])).position(x: espaco*CGFloat($0) + margin, y: baseGrafico-convertToScale(valor: data[$0]))
//                    }
                    
                    ForEach(0..<nomesEixoX.count, id: \.self) {
                        Text(nomesEixoX[$0]).position(x: espaco*CGFloat($0) + margin, y: baseGrafico + margin)
                    }
                    
                    HStack {
                        HStack {
                            Rectangle()
                                .fill(colors[0])
                                .frame(width: 20, height: 20)
                            Text(legendas[0])
                        }
                    }.position(x: centerX, y: centerY+self.alturaGrafico)
                    
                }
            }.frame(height: self.alturaGrafico*2.25)
        }
    }
    
    mutating func acharMaiorValor() -> CGFloat {
        var maior: CGFloat = 0
        for data in datas {
            for dado in data {
                if dado > maior {
                    maior = dado
                }
            }
        }
        return maior
    }
    
    func convertToScale(valor: CGFloat) -> CGFloat {
        return valor * alturaGrafico / maiorValor
    }
}


struct AreaGraph_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            AreaGraph(datas: [[10.0, 60.0, 70.0, 12, 43, 65, 12, 87, 93, 100, 23, 54], [70.0, 54.0, 0.0, 43, 54, 120, 87, 69, 32, 65, 45, 67], [23,65,87,13,42, 54.0, 0.0, 43, 54, 120, 65, 23]], titulo: "Grafico top", legendas: ["Queimada", "Arvores"], nomeseixoX: ["jan", "fev", "mar", "abr", "mai", "jun", "jul", "ago", "set", "out", "nov", "dez"])
            //AreaGraph()
        }
    }
}
