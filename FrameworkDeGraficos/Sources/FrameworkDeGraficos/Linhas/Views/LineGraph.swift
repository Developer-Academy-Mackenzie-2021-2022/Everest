import SwiftUI

public struct LineGraph: View {
    
    let lines: [Line]

    public init(data: [Line]) {
        self.lines = data
    }
    
    public var body: some View {
        LineGraphContentView(lines: lines)
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        LineGraph(data: [Line(points: [CGPoint(x: 10, y: 10)], lineTitle: "Linha toti")] )
//            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/))
//    }
//}
