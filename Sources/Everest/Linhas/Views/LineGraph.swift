import SwiftUI

public struct LineGraph: View {
    
    let data: [Line]
    let xLabels: [String]
    let yLabels: [String]
    
    public init(data: [Line], xLabels: [String], yLabels: [String]) {
        self.data = data
        self.xLabels = xLabels
        self.yLabels = yLabels
    }
    
    public var body: some View {
        VStack {
            AxisView(xLabels: xLabels, yLabels: yLabels.reversed()) {
                LineGraphContentView(lines: data)
            }
            
            VStack(alignment: .leading) {
                ForEach(0..<data.count, id: \.self ) { i in
                    LineLegendView(color: data[i].color, legendText: data[i].lineTitle)
                }
                
            }
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        
        LineGraph(data: [Line(points: [CGPoint(x: 0, y: 0), CGPoint(x: 100, y: 100)], lineTitle: "Titulo", color: Color.purple, lineWidth: 3), Line(points: [CGPoint(x: 2, y: 3), CGPoint(x: 75, y: 60)], lineTitle: "Outro título", color: Color.pink, lineWidth: 3)], xLabels: ["33","66", "100"], yLabels: ["33","66", "100"])
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/))
    }
}
