import SwiftUI


struct DispersionGraph: View {

    public var points: [CGPoint]
    public var maxValueX: CGFloat = 0
    public var maxValueY: CGFloat = 0
    
    let max: CGFloat = 100
    let min = 0

    public mutating func setScale(data: [CGPoint]){
        self.maxValueX = data.map {$0.x}.max() ?? CGFloat(0)
        self.maxValueY = data.map {$0.y}.max() ?? CGFloat(0)
    }
    
    // Construtor padrão
    public init(_ data: [CGPoint]){
        self.points = data
        //setar a escala correta nos pontos
        setScale(data: points)
        
    }
        var body: some View {
            
            GeometryReader { geometry in
                let height = geometry.size.height
                let width = geometry.size.width-40
                
                let centerY = height/2
                
                let scaleY = max/(maxValueY)
                let scaleX = (centerY-max)/(maxValueX)
                
                let colors: [Color] = [Color.green, Color.blue, Color.red]

                
                ZStack(alignment: .leading){
                    Text("Eixo Y")
                        .position(x: 30, y: centerY-max-10)
                    Text("Eixo X")
                        .position(x: width+10, y: centerY+10)
                    Path { path in
                        path.move(to: CGPoint(x: 30, y: centerY-max))
                        
                        path.addLine(to: CGPoint(x: 30, y: centerY))
                        
                        path.addLine(to: CGPoint(x: width+10, y: centerY))
                    }.stroke()
                }
                
                ZStack{
                    ForEach(0..<points.count, id: \.self) { i in
                        //let data = datas[$0]
                        //let normalizedValuex = 1-((max-points[i].x)/(max-min))
                        
                        VStack{
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 10, height: 10, alignment: .center)
                                .position(x: CGFloat((points[i].x)*scaleX+30), y: centerY-CGFloat(points[i].y)*scaleY)
                            
                        }
                        Spacer()
                    }
                }
            }
        }
    }

struct DispersionGraph_Previews: PreviewProvider {
    static var previews: some View {
        let points: [CGPoint] = [CGPoint(x: 2, y: 3),
                                         CGPoint(x: 4, y: 3),
                                         CGPoint(x: 4, y: 8),
                                         CGPoint(x: 8, y: 7),
                ]
        
       DispersionGraph(points)
        
    }
}
