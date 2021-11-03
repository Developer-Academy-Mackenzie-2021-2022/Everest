import SwiftUI
import CoreGraphics

struct RadarLabelsView: View {
    var labels: [String]
    var size: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach((0..<labels.count), id: \.self) {
                    let pos = getLabelPosition(side: $0, center: CGPoint(x: geometry.size.width/2, y: geometry.size.height/2))
                    Text(labels[$0])
                        .position(x: pos.x, y: pos.y)
                }
            }
        }
        .frame(width: size, height: size, alignment: .center)
    }
    
    private func getLabelPosition(side: Int, center: CGPoint) -> CGPoint {
        let angle: Double = 2.0 * Double.pi / Double(labels.count)
        let x: Double = cos(Double(side) * angle) * (size * 1.5)
        let y: Double = sin(Double(side) * angle) * (size * 1.5)
        return CGPoint(x: x + center.x, y: y + center.y)
    }
}

struct RadarLabelsView_Previews: PreviewProvider {
    static var previews: some View {
        let labels: [String] = [
            "Thatazinha",
            "Muzinha",
            "GKzinho",
            "Algumazinha",
            "Coisinha"
        ]
        RadarLabelsView(labels: labels, size: 100)
    }
}
