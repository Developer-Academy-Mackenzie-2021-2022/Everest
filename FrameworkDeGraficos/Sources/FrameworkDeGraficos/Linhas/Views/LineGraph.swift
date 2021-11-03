import SwiftUI

public struct LineGraph: View {
    
    let data: [Line]
    let xLabels: [String]
    let yLabels: [String]

    
    
    public var body: some View {
        AxisView(xLabels: xLabels, yLabels: yLabels.reversed(), child:{
            LineGraphContentView(lines: data)
        } )
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
      
        LineGraph(data: [Line(points: [CGPoint(x: 0, y: 0), CGPoint(x: 100, y: 100)], lineTitle: "Titulo", color: Color.purple, lineWidth: 3)], xLabels: ["33","66", "100"], yLabels: ["33","66", "100"])
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/))
    }
}
