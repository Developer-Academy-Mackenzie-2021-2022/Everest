import SwiftUI

public struct DispersionGraph {
            
    // Construtor padrão
    public init(_ data: [[CGFloat]]){

    }
}

struct DispersionGraphView: View{
    public var body: some View {
        
    }
}

struct DispersionGraph_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            let data: [[CGFloat]] = [[10.0, 50.0, 30.0, 40.0, 100.0,60.0, 30.0,2.0], [2.0, 30.0, 90.0, 40.0, 0.0,60.0, 25.0,2.0]]
            DispersionGraph(data)
        }
    }
}
