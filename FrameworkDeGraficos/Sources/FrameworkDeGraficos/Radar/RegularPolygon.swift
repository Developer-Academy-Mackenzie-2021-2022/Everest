import SwiftUI

struct RegularPolygon: Shape {
    var sides: Int
    var size: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        var chartPoints: [CGPoint] = []
        let center: CGPoint = CGPoint(x: rect.width/2, y: rect.height/2)
        let angle: Double = 2.0 * Double.pi / Double(sides)
        for i in 0..<sides {
            let x: Double = cos(Double(i) * angle) * (size)
            let y: Double = sin(Double(i) * angle) * (size)
            let point = CGPoint(x: x+center.x, y: y+center.y)
            chartPoints.append(point)
        }
        path.addLines(chartPoints)
        path.closeSubpath()
        
        return path
    }
}

struct RegularPolygon_Previews: PreviewProvider {
    static var previews: some View {
        RegularPolygon(sides: 6, size: 100)
            .stroke(Color(.red))
    }
}
/// conclusão do código.
