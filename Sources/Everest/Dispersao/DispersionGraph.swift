import SwiftUI

public struct DispersionGraph: View {

    public var points: [[CGPoint]]
    private var maxValueX: CGFloat = 0
    private var minValueX: CGFloat = 0

    private var maxValueY: CGFloat = 0
    private var minValueY: CGFloat = 0
    
    let max: CGFloat = 200
    let min: CGFloat = 0
    
    
    ///as variavies a seguir sao opcionais para o usuario construir o gráfico
    public var title: String
    public var eixoX: String
    public var eixoY: String
    
    ///vetor de cores deve ser correspondente à quantidade de variaveis de entrada
    public var colors: [Color]
    public var subtitle: [String]

    
    /// Construtor padrão
    public init(_ data: [[CGPoint]],title:String = "Gráfico de Dispersão",eixoX:String = "Eixo X", eixoY: String = "Eixo Y",colors: [Color] = colorsDefault,subtitle: [String] = labelsDefault){
        self.points = data
        self.title = title
        self.eixoX = eixoX
        self.eixoY = eixoY
        self.colors = colors
        self.subtitle = subtitle
        //setar a escala correta nos pontos
        setScale(data: points)
        
        
    }
    ///funcao auxiliar para normalizacao
    private mutating func setScale(data: [[CGPoint]]){
        self.maxValueX = data[0].map({$0.x}).max() ?? CGFloat(0)
        self.maxValueY = data[0].map({$0.y}).max() ?? CGFloat(0)
        
        self.minValueX = data[0].map({$0.x}).min() ?? CGFloat(0)
        self.minValueY = data[0].map({$0.y}).min() ?? CGFloat(0)
        
        for i in 0..<data.count {
            let maxx = data[i].map({$0.x}).max() ?? CGFloat(0)
            let maxy = data[i].map({$0.y}).max() ?? CGFloat(0)
            
            let minx = data[i].map({$0.x}).min() ?? CGFloat(0)
            let miny = data[i].map({$0.y}).min() ?? CGFloat(0)
            
            if i > 0 {
                if self.maxValueX < maxx {self.maxValueX = maxx}
                
                if self.maxValueY < maxy {self.maxValueY = maxy}
                
                if self.minValueX > minx {self.minValueX = minx}
                
                if self.minValueY > miny {self.minValueY = miny}
            }
        }
        ///se nao houverem valores negativos no grafico teremos a origem em 0,0
        if (self.minValueX>0){self.minValueX = 0}
        if (self.minValueY>0){self.minValueY = 0}
        
    }
    
    ///funcao para mudar as cores do grafico
    private mutating func setColors(newColors: [Color]) -> [Color]{
        self.colors = newColors
        return self.colors
    }
    
    
    public var body: some View {
            GeometryReader { geometry in
                let height = geometry.size.height
                let width = geometry.size.width-40
                
                let centerY = height/2
                
                let scaleY = max/(maxValueY-minValueY)
                let scaleX = (width-(max/2))/(maxValueX-minValueX)
                
                VStack(alignment: .leading){
                    Text(title)
                        .font(.title).bold()
                    Spacer()
                    ///linhas dos eixos
                    ZStack(alignment: .leading){
                        Text(eixoY)
                            .position(x: 50, y: centerY-max-40)
                            .font(.subheadline)
                            .padding(.leading)
                        Text(eixoX)
                            .position(x: width-20, y: centerY-20)
                            .font(.subheadline)
                        Path { path in
                            path.move(to: CGPoint(x: 50, y: centerY-max-20))
                            
                            path.addLine(to: CGPoint(x: 50, y: centerY))
                            
                            path.addLine(to: CGPoint(x: width, y: centerY))
                        }.stroke(Color.secondary, lineWidth: 3)
                        ///grafico plotado com pontos
                        ZStack{
                            ForEach(0..<points.count, id: \.self) { i in
                                
                                DrawImage(points: points[i], scaleX: scaleX, scaleY: scaleY, centerY: centerY, color: colors[i],minx: minValueX, miny: minValueY)
                            }
                            ///print dos eixos y e eixo x
                            ForEach (0..<5, id: \.self) { i in
                                let auxX = CGFloat(i)*CGFloat((width-(max/2))/4)+CGFloat(50)
                                let value = Float(minValueX)+(Float(maxValueX-minValueX)/4)*Float(i)
                                Text(String(format:"%.1f",value))
                                    .position(x: CGFloat(auxX), y: centerY + CGFloat(15))
                                    .font(.system(size: 12))
                            }
                            ForEach (0..<5, id: \.self) { i in
                                let auxY = centerY-CGFloat(i)*CGFloat((max+50)/5)
                                let value = Float(minValueY)+(Float(maxValueY-minValueY)/4)*Float(i)
                                Text(String(format:"%.1f",value))
                                    .position(x:50-20, y:CGFloat(auxY))
                                    .font(.system(size: 12))
                            }
                        }
                       
                    }
                    Spacer()
                    VStack{
                        ///legenda
                        ForEach(0..<points.count, id: \.self) { i in
                            HStack{
                                Rectangle()
                                    .fill(colors[i])
                                    .frame(width: 10, height: 10, alignment: .center)
                                Text(subtitle[i])
                                    .font(.subheadline)
                            }
                           
                        }
                    }.padding()
                }.padding()
            }
        }
    }

struct DispersionGraph_Previews: PreviewProvider {
    static var previews: some View {
        let colors: [Color] = [Color.blue, Color.pink, Color.green]
        let points: [[CGPoint]] = [[CGPoint(x: 20, y: 30),
                                         CGPoint(x: 40, y: 30),
                                         CGPoint(x: 40, y: 80),
                                         CGPoint(x: 80, y: 70)],
                                  [CGPoint(x: 50, y: 20),
                                        CGPoint(x: 60, y: 40),
                                        CGPoint(x: 10, y: 80),
                                        CGPoint(x: 30, y: 50)]]
        DispersionGraph(points,colors: colors)
    }
}
