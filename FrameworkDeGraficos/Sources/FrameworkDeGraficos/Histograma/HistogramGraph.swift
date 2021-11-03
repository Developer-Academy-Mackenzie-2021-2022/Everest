
import CoreGraphics
import SwiftUI


public struct Histograma: View {

    @State private var data: [CGPoint]
    private let defaultColors: [Color] = [Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.purple]
    
    public init(data: [CGPoint]) {
        self.data = data
    }
    
    public var body: some View {
        HStack(alignment: .bottom, spacing: 1.5) {
            ForEach(Array(self.data.enumerated()), id: \.offset) { index, point in
                Bar(color: Color.blue, value: point.y, width: 50)

            }
        }
    }
}

struct Histograma_Previews: PreviewProvider {
    static var previews: some View {
        //        Histograma(data: [CGPoint(x: 3, y: 1)])
        Histograma(data: [CGPoint(x: 10, y: 100), CGPoint(x: 15, y: 120), CGPoint(x: 30, y: 150)])
    }
}
