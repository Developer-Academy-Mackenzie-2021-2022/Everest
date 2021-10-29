import SwiftUI

public struct DrawImage: View {
    private var points: [CGPoint]
    private var scaleX: CGFloat
    private var scaleY: CGFloat
    private var centerY: CGFloat
    public var color: Color
    
    public init (points: [CGPoint], scaleX: CGFloat, scaleY: CGFloat, centerY: CGFloat, color: Color) {
        self.points = points
        self.scaleX = scaleX
        self.scaleY = scaleY
        self.centerY = centerY
        self.color = color
    }
    
    public var body: some View {
        ZStack {
            ForEach (0..<points.count, id: \.self) { i in
                VStack {
                    Circle()
                        .fill(color)
                        .frame(width: 10, height: 10, alignment: .center)
                        .position(x: CGFloat((points[i].x)*scaleX+50), y: centerY-CGFloat(points[i].y)*scaleY)
                }
                
                let auxX = points[i].x*scaleX+CGFloat(50)
                let auxY = centerY-points[i].y*scaleY
                Text(String(format: "%.0f", points[i].x))
                    .position(x: CGFloat(auxX), y:centerY + CGFloat(10))
                    .font(.subheadline)
                Text(String(format: "%.0f", points[i].y))
                    .position(x:50-20 , y:CGFloat(auxY))
                    .font(.subheadline)
            }
        }

    }
}

struct DispersionGraph: View {

    public var points: [[CGPoint]]
    public var maxValueX: CGFloat = 0
    public var maxValueY: CGFloat = 0
    public let colors: [Color] = [Color.green, Color.blue, Color.red]
    
    let max: CGFloat = 200
    let min: CGFloat = 0
    
    
    public mutating func setScale(data: [[CGPoint]]){
        for i in 0..<data.count {
            if i > 0 {
                if self.maxValueX < data[i].map {$0.x}.max() ?? CGFloat(0) {
                    self.maxValueX = data[i].map {$0.x}.max() ?? CGFloat(0)
                }
                
                if self.maxValueY < data[i].map {$0.y}.max() ?? CGFloat(0) {
                    self.maxValueY = data[i].map {$0.y}.max() ?? CGFloat(0)
                }
            }
            
            else {
                self.maxValueX = data[i].map {$0.x}.max() ?? CGFloat(0)
                self.maxValueY = data[i].map {$0.y}.max() ?? CGFloat(0)
            }
            
        }
        
    }
    
    // Construtor padrão
    public init(_ data: [[CGPoint]]){
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

                
                ZStack(alignment: .leading){
                    Text("Eixo Y")
                        .position(x: 50+20, y: centerY-max-10)
                        .font(.subheadline)
                    Text("Eixo X")
                        .position(x: width, y: centerY-20)
                        .font(.subheadline)
                    Path { path in
                        path.move(to: CGPoint(x: 50, y: centerY-max))
                        
                        path.addLine(to: CGPoint(x: 50, y: centerY))
                        
                        path.addLine(to: CGPoint(x: width, y: centerY))
                    }.stroke(Color.secondary, lineWidth: 3)
                }
                
                ZStack{
                    ForEach(0..<points.count, id: \.self) { i in
                        
                        DrawImage(points: points[i], scaleX: scaleX, scaleY: scaleY, centerY: centerY, color: colors[i] )
                        
                        Spacer()
                        
                    }
                }
            }
        }
    }

struct DispersionGraph_Previews: PreviewProvider {
    static var previews: some View {
        let points: [[CGPoint]] = [[CGPoint(x: 2, y: 3),
                                         CGPoint(x: 4, y: 3),
                                         CGPoint(x: 4, y: 8),
                                         CGPoint(x: 8, y: 7)],
                                  [CGPoint(x: 5, y: 2),
                                        CGPoint(x: 6, y: 4),
                                        CGPoint(x: 1, y: 8),
                                        CGPoint(x: 3, y: 5)]]
        
       DispersionGraph(points)
        
    }
}
