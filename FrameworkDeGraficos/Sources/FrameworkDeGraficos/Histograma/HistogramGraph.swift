
import CoreGraphics
import SwiftUI


public struct Histograma: View {
    
    public private(set) var text = "Hello, World!"
    
    @State private var data: [CGFloat]
    var labels: [String]
    private var colors: [Color] = []
    
    
    public init(data: [CGFloat], labels: [String], colors: [Color]) {
        self.data = data
        self.labels = labels
        self.colors = colors
        
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width - 40
            let height = geometry.size.height / 2
            let centerY = height
            let maxValue = data.max() ?? 0
            let minValue = data.min() ?? 0
            let max: CGFloat = 200.0
            
            ZStack (alignment: .center) {
                ZStack (alignment: .center) {
                    Text("Y")
                        .position(x: 30, y: centerY-max+10)
                        .font(.subheadline)
                    Text("X")
                        .position(x: width-5, y: centerY+20)
                        .font(.subheadline)
                    
                    Path { path in
                        path.move(to: CGPoint(x: 50, y: centerY-max-2))
                        
                        path.addLine(to: CGPoint(x: 50, y: centerY-7))
                        
                        path.addLine(to: CGPoint(x: width, y: centerY-7))
                    }.stroke(Color.secondary, lineWidth: 3)
                    
                }.offset(y: 60)
                
                VStack {
                    ZStack{
                        HStack(alignment: .bottom, spacing: 0.5) {
                            ForEach(0..<data.count, id: \.self) {
                                Bar(color: colors[$0], colorLabel: .black, textLabel: labels[$0], value: data[$0], width: (width - 67) / CGFloat(data.count))
                            }
                        }
                    }
                }
            }
        }
    }
}

struct Histograma_Previews: PreviewProvider {
    static var previews: some View {
        Histograma(data: [50, 30, 40, 70, 20, 80, 60],
                   labels: ["A", "B", "C", "D", "E", "F", "G"],
                   colors: [Color(red: 245/255, green: 69/255, blue: 79/255), //vermelho
                            Color(red: 239/255, green: 114/255, blue: 65/255), //laranja escuro
                            Color(red: 244/255, green: 150/255, blue: 63/255), //laranja claro
                            Color(red: 247/255, green: 197/255, blue: 99/255), //amarelo
                            Color(red: 146/255, green: 188/255, blue: 117/255), //verde
                            Color(red: 77/255, green: 168/255, blue: 141/255), //verde água
                            Color(red: 89/255, green: 119/255, blue: 142/255) //azul
                            
                           ]
        )
    }
}


