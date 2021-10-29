import SwiftUI


struct DispersionGraph: View {

    public var points: [CGPoint]
    // Construtor padrão
    public init(_ data: [CGPoint]){
        self.points = data
        
    }
        var body: some View {
            let max: CGFloat = 100
            let min = 0
            
            
            GeometryReader { geometry in
                let height = geometry.size.height
                let width = geometry.size.width-40
                
                let centerY = height/2
                
                let colors: [Color] = [Color.green, Color.blue, Color.red]

                
                HStack {
                    VStack {
                        ForEach((1...10).reversed(), id: \.self) {
                            Text("\($0)")
                        }
                    }
                    
                    Spacer()
                    
                    Path { path in
                        path.move(to: CGPoint(x: 30, y: centerY-(max*1.2)))
                        
                        path.addLine(to: CGPoint(x: 30, y: centerY+max))
                        
                        path.addLine(to: CGPoint(x: width-40, y: centerY+max))

                    }.stroke()
                    
                    Spacer()
                    
                    HStack {
                        ForEach((1...10).reversed(), id: \.self) {
                            Text("\($0)")
                        }
                    }.padding(.top, 300).padding(.leading, -300)

                    
                }.padding()
                
                
               
               
                
                HStack{
                    ForEach(0..<points.count, id: \.self) { i in
                        
                        VStack{
                            Circle()
                                .fill(colors[0])
                                .frame(width: 10, height: 10, alignment: .center)
                                .position(x: (points[i].x), y: (centerY-points[i].y))


                        }.padding(-5)
                        Spacer()
                    }.padding(-5)
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
