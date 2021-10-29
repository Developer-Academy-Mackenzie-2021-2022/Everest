import SwiftUI

struct RadarChartView: View {
    var data: [Double]
    var size: Double
    var colors: [Color]
    
    var body: some View {
        ZStack {
            // Grid
            RegularPolygon(sides: data.count, size: size)
                .stroke()
                .rotationEffect(Angle(degrees: -90))
            RegularPolygon(sides: data.count, size: size*3/4)
                .stroke()
                .rotationEffect(Angle(degrees: -90))
            RegularPolygon(sides: data.count, size: size/2)
                .stroke()
                .rotationEffect(Angle(degrees: -90))
            RegularPolygon(sides: data.count, size: size/4)
                .stroke()
                .rotationEffect(Angle(degrees: -90))
            
            // Radar Red
            Radar(data: data)
                .stroke(.red)
                .frame(width: size, height: size, alignment: .center)
                .rotationEffect(Angle(degrees: -90))
            
            // Radar Green
            Radar(data: data.shuffled())
                .stroke(.green)
                .frame(width: size, height: size, alignment: .center)
                .rotationEffect(Angle(degrees: -90))
        }
    }
    
    struct Radar: Shape {
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
}

struct RadarChartView_Previews: PreviewProvider {
    static var previews: some View {
        let data: [Double] = [
            0.8,
            1,
            0.6,
            0.7,
            0.9,
            0.5
        ]
        RadarChartView(data: data, size: 100, colors: [Color.red])
    }
}
