//
//  SwiftUIView.swift
//  
//
//  Created by Marcus Vinicius Silva de Sousa on 29/10/21.
//

import SwiftUI

struct CashFlowView: View {
    
    let data = [25.3, 30, 6, 7.4, 12.34]
    let years = [2017, 2018, 2019, 2020, 2021]
    var body: some View {
        
        GeometryReader { bounds in
            ZStack {
                VStack{
                    HStack(alignment: .bottom){
                        VStack{
                            ForEach(0..<data.count) { index in
                                Text(String(format: "%.2f", data[index]))
                                    .font(.caption)
                            }
                            Spacer()
                        }
                        
                        
                        ForEach(0..<data.count) { index in
                            VStack {
                                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .frame(height: CGFloat(data[index])*2)
                                    .clipShape(Rectangle())
                                    .padding(.horizontal, 5)
                                HStack{
                                    Text(String(years[index]))
                                }
                            }
                            
                        }
                        
                    }
                    .padding()
                }
                .background(
                    Color.white
                        .cornerRadius(25.0)
                        .opacity(0.3)
                )
            
                
            }
            
        }
    }
}
struct CashFlowChartView_Previews: PreviewProvider {
    static var previews: some View {
        CashFlowView()
            .previewLayout(.fixed(width: 400, height: 400))
    }
}
