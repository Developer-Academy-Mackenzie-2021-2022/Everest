//
//  SwiftUIView.swift
//
//
//  Created by Thallis Sousa on 03/11/21.
//

import SwiftUI


public struct PieChart: View {    
    public var data: [Double] = []
    public var label: [String] = []
    public var cor: [Color] = []
    public var legenda: [String] = []
    
    public init(data: [Double] = [27, 15, 18, 40],
                cor:[Color] = [Color(red: 245 / 255, green: 69 / 255, blue: 79 / 255), Color(red: 146 / 255, green: 188 / 255, blue: 117 / 255), Color(red: 244 / 255, green: 150 / 255, blue: 63 / 255), Color(red: 89 / 255, green: 119 / 255, blue: 142 / 255)],
                legenda:[String] = ["Agro", "Transp.", "Indústria", "Energia"]){
        

        let totalValue = getTotalValue(data: data)
        for i in 0..<data.count{
            self.data.append(DataNormalizer.shared.normalizeByScaleFactor(data[i], scaleFactor: 1/totalValue))
        }

        
        self.label = self.data.map{ value in String(format: "%.2f", value*100) + "%" }
        self.cor = cor
        self.legenda = legenda
    }
    
    
    public var body: some View {
        ZStack {
            ForEach(0..<data.count) { index in
                let currentData = data[index]
                let currentEndDegree =
                currentData * 360
                let lastDegree =
                data.prefix(index).map
                { $0 }.reduce(0, +) *
                360
                
                
                
                VStack {
                    
                    
                    ZStack {
                        PieceOfPie(startDegree: lastDegree, endDegree: lastDegree + currentEndDegree)
                            .fill(cor[index])
                        
                        
                        GeometryReader { geometry in
                            Text(label[index]).font(.custom("System", size: 17))
                                .foregroundColor(.white)
                                .position(getLabelCoordinate(in: geometry.size, for: lastDegree + (currentEndDegree / 2)))
                            
                            
                        }
                    } .frame(width: 300, height: 300, alignment: .center)
                    
                    // Desenho das legendas
                    HStack(alignment: .bottom) {
                        ForEach(0..<legenda.count, id: \.self) {
                            Rectangle()
                                .fill(cor[$0])
                                .frame(width: 10, height: 10)
                            
                            Text(legenda[$0]).font(.subheadline)
                            
                            
                        }
                    }                }
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

private func getTotalValue(data: [Double]) -> Double {
    var soma: Double = 0
    for d in data {
        soma += d
    }
    return soma
}


struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        
        PieChart()
        
    }
}


