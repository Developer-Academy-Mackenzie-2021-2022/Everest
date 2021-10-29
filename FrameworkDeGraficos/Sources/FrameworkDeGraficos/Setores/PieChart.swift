import SwiftUI

////ViewModels
final class PieChartViewModel: ObservableObject {

    init(data: [Double], label:[String], cor:[Color]){
        self.data = data
        self.label = label
        self.cor = cor
    }
    var data: [Double] = []
    var label: [String] = []
    var cor: [Color] = []
    
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
    @ObservedObject var viewModel = PieChartViewModel(data: [0.1, 0.3, 0.4, 0.2], label: ["oi", "th", "po", "hi"], cor: [.blue, .red, .yellow, .gray])
   
    
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
          
                ZStack {
                    PieceOfPie(startDegree: lastDegree, endDegree: lastDegree + currentEndDegree)
                        .fill(viewModel.cor[index])
                    
                    
                    GeometryReader { geometry in
                        Text(viewModel.label[index]).font(.custom("System", size: 17))
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
//        NavigationView{
//            ScrollView
//        }
        VStack(alignment: .leading) {
            Text("Gráfico de Setores").font(.largeTitle)
                .padding()
            Text("Subtitulo").font(.title)
            // é title1 mas não tem no .font
          
            
            PieChart()
                
            
    }
//        .navigationTitle("Gráfico de Setores")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//
        
    }
}
/*public struct SectorGraph {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}*/
}
