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
                
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .opacity(0.6)
                    .edgesIgnoringSafeArea(.top)
                    .edgesIgnoringSafeArea(.bottom)
                Text(String(data[1]))
                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .position(x: 0, y: data[1])
//                Text(String(data[0]))
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                Text(String(data[4]))
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                Text(String(data[3]))
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                Text(String(data[2]))
//                    .frame(maxWidth: .infinity, alignment: .leading)
                    VStack{
                        HStack(alignment: .bottom){
                            ForEach(0..<data.count) { index in
                                //RoundedRectangle(cornerSize: CGSize(width: 5, height: data[index]))
                                VStack {
                                    Text(String(format: "%.2f", data[index]))
                                        .font(.caption)
                                        
                                    LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                        .frame(height: CGFloat(data[index])*20)
                                        .clipShape(Rectangle())
//                                        .background(
//                                            Color.red
//                                        )
                                   .padding(.horizontal, 5)
                                    HStack{
                                        Text(String(years[index]))
//                                            .font(.caption)
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
                    .frame(width: bounds.size.width-50, height: bounds.size.width)
                    
                }
                
            }
        }
    }
struct CashFlowChartView_Previews: PreviewProvider {
    static var previews: some View {
        CashFlowView()
    }
}
