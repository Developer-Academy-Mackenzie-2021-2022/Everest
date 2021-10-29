import SwiftUI
import XCTest

// Models

//enum Asset {
   // case equity, cash, bond, realEstate
// }


struct AssetAllocation {
  //  let asset: Asset
    let percentage: Double
    let description: String
    let color: Color
    let value: String
}

//ViewModels
final class PieChartViewModel: ObservableObject {
 /*   @Published var data: [AssetAllocation] = [
        AssetAllocation(percentage: 0.25, description: "Desmatamento", color: .blue, value: "25%"),
        AssetAllocation(percentage: 0.25, description: "Poluição", color: .gray, value: "25%"),
        AssetAllocation(percentage: 0.25, description: "    Combustíveis \n    Fósseis", color: .red, value: "25%"),
        AssetAllocation(percentage: 0.25, description: "Matriz \nEnergética", color: .green, value: "25%"),
    ]
*/
    @Published var data: [Double] = [
        0.25,
        0.25,
        0.25,
        0.25,
    ]
        
    
    
}


// Views
struct PieceOfPie: Shape {
    let startDegree: Double
    let endDegree: Double
    
    func path(in rect: CGRect) -> Path {
        Path { p in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            p.move(to: center)
            p.addArc(center: center, radius: rect.width / 2, startAngle: Angle(degrees: startDegree), endAngle: Angle(degrees: endDegree), clockwise: false)
            p.closeSubpath()
            
        }
    }
    
    
}

struct PieChart: View {
    @ObservedObject var viewModel = PieChartViewModel()
    var data: [Double]
//    init(data: [AssetAllocation]) {
//        viewModel.data = data
//    }
    
    var body: some View {
        ZStack {
            ForEach(0..<viewModel.data.count) { index in
                let currentData = viewModel.data[index]
                let currentEndDegree =
                currentData * 360
                let lastDegree =
                viewModel.data.prefix(index).map
                { $0 }.reduce(0, +) *
                360
               // PieceOfPie(startDegree: 0, endDegree: 90).fill(.orange)
               // PieceOfPie(startDegree: 90, endDegree: 180).fill(.blue)
                ZStack {
                    PieceOfPie(startDegree: lastDegree, endDegree: lastDegree + currentEndDegree)
                        .fill(Color(.red))
                    
                    GeometryReader { geometry in
                        Text(currentData.description).font(.custom("Avenir", size: 17))
                            .foregroundColor(.black)
                            .position(getLabelCoordinate(in: geometry.size, for: lastDegree + (currentEndDegree / 2)))
                        
                    }
                
                    
                    
                }
                
            }
          
        }
    }
    
    private func getLabelCoordinate(in geoSize: CGSize, for degree: Double)  -> CGPoint  {
        let center = CGPoint(x: geoSize.width / 2, y: geoSize.height / 2)
        let radius = geoSize.width / 3
        
        let yCoordinate = radius * sin(CGFloat(degree) * (CGFloat.pi / 180))
        let xCoordinate = radius * cos(CGFloat(degree) * (CGFloat.pi / 180))
        
        return CGPoint(x: center.x + xCoordinate, y: center.y + yCoordinate)
        
    }
}



struct ContentView: View {
    var body: some View {
    
        VStack(alignment: .trailing) {
            PieChart(data: <#T##[Double]#>)
            Text(" Gráfico de Setores")
            .font(.title)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          //  .frame(width: 300, height: 300, alignment: .center)
    }
}
/*public struct SectorGraph {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}*/
}
