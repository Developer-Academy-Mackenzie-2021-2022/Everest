import SwiftUI

struct RadarGridView: View {
    var gridSize: Int
    var sides: Int
    var size: Double
    
    var body: some View {
        ZStack {
            ForEach((1...gridSize), id: \.self) {
                if $0 == gridSize {
                    RegularPolygon(sides: sides, size: size*Double($0)/Double(gridSize))
                        .stroke(.black)
                } else {
                    RegularPolygon(sides: sides, size: size*Double($0)/Double(gridSize))
                        .stroke(.black.opacity(0.5))
                }
            }
//            ForEach((0..<sides), id: \.self){
//                let center: CGPoint = CGPoint(x: 50, y: 100)
//                let angle: Double = 2.0 * Double.pi / Double(sides)
//                let x: Double = cos(Double($0) * angle) * (data[i]*rect.maxX)
//                let y: Double = sin(Double($0) * angle) * (data[i]*rect.maxY)
//                Text("Gkzinho")
//                    .font(.title)
//                    .position(x: x+center.x, y: y+center.y)
//            }
        }
        .frame(width: size*2, height: size*2, alignment: .center)
    }
}

struct RadarGridView_Previews: PreviewProvider {
    static var previews: some View {
        RadarGridView(gridSize: 4, sides: 5, size: 100)
    }
}
