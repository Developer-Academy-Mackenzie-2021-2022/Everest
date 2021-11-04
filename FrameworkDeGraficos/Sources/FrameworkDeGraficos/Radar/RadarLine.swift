import SwiftUI

struct RadarLine: Shape {
    let data: [Double]
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        var chartPoints: [CGPoint] = []
        let center: CGPoint = CGPoint(x: rect.width/2, y: rect.height/2)
        let angle: Double = 2.0 * Double.pi / Double(data.count)
        for i in 0..<data.count {
            let x: Double = cos(Double(i) * angle) * (data[i]*rect.maxX)
            let y: Double = sin(Double(i) * angle) * (data[i]*rect.maxY)
            let point = CGPoint(x: x+center.x, y: y+center.y)
            chartPoints.append(point)
        }
        path.addLines(chartPoints)
        path.closeSubpath()
        
        return path
    }
}

struct RadarLineView_Previews: PreviewProvider {
    static var previews: some View {
        let data: [Double] = [0.8, 1, 0.6, 0.7, 0.9, 0.5]
        RadarLine(data: data)
    }
}
