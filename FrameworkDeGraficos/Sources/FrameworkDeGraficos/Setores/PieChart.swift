import SwiftUI

struct PieChart: View {
    @ObservedObject
    var viewModel = PieChartViewModel(data: [0.5, 0.3, 0.1, 0.1],
    cor: [.blue, .red, .yellow, .gray],
    legenda: ["Legenda do Oi", "legenda vermelha", "legenda azul", "legenda cinza"])
        
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
                            .foregroundColor(.white)
                            .position(getLabelCoordinate(in: geometry.size, for: lastDegree + (currentEndDegree / 2)))
                    
//                        // Desenho das legendas
//                                       HStack {
//                                           ForEach(0..<legenda.count, id: \.self) {
//                                               Rectangle()
//                                                   .fill(colors[$0])
//                                                   .frame(width: 10, height: 10)
//                                               Text(legendas[$0]).font(.subheadline)
//                                           }
//                                       }.position(x: centerX, y: centerY+ContentView.frame)
                                       
                        
                        
                    }
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




struct ContentView: View {
    var body: some View {
            
            PieChart()
        
    
            .frame(width: 300, height: 300, alignment: .center)
            // .padding() //em relação à legenda
                
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       
        ContentView()
        
    }
}

final class PieChartViewModel: ObservableObject {

    init(data: [Double], cor:[Color], legenda:[String]){
        self.data = data
        self.label = data.map{ value in "\(value*100)%" }
        self.cor = cor
        self.legenda = legenda
    }
   
    var data: [Double] = []
    var label: [String] = []
    var cor: [Color] = []
    var legenda: [String] = []
    
}
