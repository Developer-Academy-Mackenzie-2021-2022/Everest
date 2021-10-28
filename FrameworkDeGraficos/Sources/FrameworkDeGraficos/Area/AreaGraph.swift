import SwiftUI

public struct AreaGraph: View {
    public var datas: [[CGFloat]]
    public var titulo: String
    public var legendas: [String]
    public var nomesEixoX: [String]
    public var colors: [Color] = [Color.red, Color.blue]
    
    public init(datas: [[CGFloat]] = [[10.0,100.0,15.0]], titulo: String = "Title", legendas: [String] = ["legenda"], nomeseixoX: [String] = ["nome"]) {
        self.datas = datas
        self.titulo = titulo
        self.legendas = legendas
        self.nomesEixoX = nomeseixoX
    }
    
    public var body: some View {
        VStack {
            GeometryReader { geometry in
                let height = geometry.size.height
                let width = geometry.size.width
                
                
                let margin: CGFloat = 25
                
                let centerY = height/2
                
//                Text(titulo)
//                    .font(.title)
//                    .position(x: width/2, y: centerY-100)
                
                ForEach(0..<datas.count, id: \.self) {
                    let data = datas[$0]
                    let espaco = (width - (margin*2)) / CGFloat(data.count - 1)
                    
                    Path { path in
                        path.move(to: CGPoint(x: margin, y: centerY))
                        
                        
                        for i in 0..<data.count {
                            path.addLine(to: CGPoint(x: espaco*CGFloat(i) + margin, y: centerY-data[i]))
                            if i == data.count-1 {
                                path.addLine(to: CGPoint(x: espaco*CGFloat(i) + margin, y: centerY))
                            }
                        }
                        
                    }.fill(colors[$0].opacity(0.3))
                    
                    Path { path in
                        
                        path.move(to: CGPoint(x: margin, y: centerY-data[0]))
                        
                        for i in 0..<data.count {
                            path.addLine(to: CGPoint(x: espaco*CGFloat(i) + margin, y: centerY-data[i]))
                            
                        }
                    }.stroke(colors[$0],lineWidth: 3)
                    
                    ForEach(0..<data.count, id: \.self) {
                        Text(String(format: "%.2f", data[$0])).position(x: espaco*CGFloat($0) + margin, y: centerY-data[$0])
                        
                        
                    }
                    
                    ForEach(0..<nomesEixoX.count, id: \.self) {
                        Text(nomesEixoX[$0]).position(x: espaco*CGFloat($0) + margin, y: centerY + margin)
                    }
                    
                }
            }
//            Rectangle()
//                .fill(colors[0])
//                .frame(width: 20, height: 20)
//            Text(legendas[0])
        }
    }
}


struct AreaGraph_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            AreaGraph(datas: [[10.0, 60.0, 70.0], [70.0, 54.0, 0.0]], legendas: ["Queimada", "Arvores"], nomeseixoX: ["jan", "fev", "mar"])
        }
    }
}
