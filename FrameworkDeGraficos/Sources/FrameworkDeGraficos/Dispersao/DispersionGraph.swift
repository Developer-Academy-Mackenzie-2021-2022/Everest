import SwiftUI

public struct DispersionGraph {
            
    // Construtor padrão
    public init(_ data: [[CGFloat]]){

    }
}

struct DispersionGraphView: View {

        var body: some View {
            let max: CGFloat = 100
            let min = 0
            
            
            GeometryReader { geometry in
                let height = geometry.size.height
                let width = geometry.size.width-40
                
                let centerY = height/2
                
                let datas: [CGFloat] = [2,4,4,8,2,4,4,8,8]
                
                let datasy: [CGFloat] = [3,3,8,7,3,3,8,7,7]
                
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
                    ForEach(0..<datas.count, id: \.self) { i in
                        //let data = datas[$0]
                        VStack{
                            Circle()
                                .fill(colors[0])
                                .frame(width: 10, height: 10, alignment: .center)
                                .position(x: (datas[i]), y: (centerY-datasy[i]))


                        }.padding(-5)
                        Spacer()
                    }.padding(-5)
                }
            }
        }
    }

struct DispersionGraph_Previews: PreviewProvider {
    static var previews: some View {
       DispersionGraphView()
    }
}
