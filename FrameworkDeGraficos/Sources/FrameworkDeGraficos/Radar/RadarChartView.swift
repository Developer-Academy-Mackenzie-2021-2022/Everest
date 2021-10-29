import SwiftUI

struct RadarChartView: View {
    var data: [CGPoint]
    var size: Double
    
    var body: some View {
        Radar(data: data)
            .frame(width: size*2, height: size*2, alignment: .center)
            .rotationEffect(Angle(degrees: -90))
    }
    
    struct Radar: Shape {
        let data: [CGPoint]
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            var chartPoints: [CGPoint] = []
            let center: CGPoint = CGPoint(x: rect.width/2, y: rect.height/2)
            let angle: Double = 2.0 * Double.pi / Double(data.count)
            for i in 0..<data.count {
                let x: Double = cos(Double(i) * angle) * (data[i].y*rect.maxX)
                let y: Double = sin(Double(i) * angle) * (data[i].y*rect.maxY)
                let point = CGPoint(x: x+center.x, y: y+center.y)
                chartPoints.append(point)
            }
            path.addLines(chartPoints)
            path.closeSubpath()
            
            return path
        }
    }
}

struct RadarChartView_Previews: PreviewProvider {
    static var previews: some View {
        let data: [CGPoint] = [
            CGPoint(x: 0, y: 0.5),
            CGPoint(x: 1, y: 0.5),
            CGPoint(x: 2, y: 0.5),
            CGPoint(x: 3, y: 0.5),
            CGPoint(x: 4, y: 0.5),
        ]
        RadarChartView(data: data, size: 100)
    }
}
