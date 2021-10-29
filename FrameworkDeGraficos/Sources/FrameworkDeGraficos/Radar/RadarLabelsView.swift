import SwiftUI
import CoreGraphics

struct RadarLabelsView: View {
    var labels: [String]
    var size: Double
    
    var body: some View {
        ZStack {
            ForEach((0..<labels.count), id: \.self) {
                let pos = getLabelPosition(side: $0)
                Text(labels[$0])
                    .position(x: pos.x, y: pos.y)
            }
        }
    }
    
    private func getLabelPosition(side: Int) -> CGPoint {
        let center: CGPoint = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
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
            .rotationEffect(Angle(degrees: -90))
    }
}
