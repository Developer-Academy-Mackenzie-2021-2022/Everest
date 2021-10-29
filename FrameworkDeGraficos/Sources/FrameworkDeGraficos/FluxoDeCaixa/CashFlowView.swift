//
//  SwiftUIView.swift
//  
//
//  Created by Marcus Vinicius Silva de Sousa on 29/10/21.
//

import SwiftUI

struct CashFlowView: View {
    
    let data = [25.3, 30, 6, 7.4, 12.34]
    var body: some View {
        
        GeometryReader { bounds in
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .opacity(0.6)
                    .edgesIgnoringSafeArea(.top)
                    .edgesIgnoringSafeArea(.bottom)
                
                VStack{
                    VStack{
                        HStack(alignment: .bottom){
                            ForEach(0..<data.count) { index in
                                //RoundedRectangle(cornerSize: CGSize(width: 5, height: data[index]))
                                VStack {
                                    Text(String(format: "%.2f", data[index]))
                                        .font(.caption)
                                    LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                        .frame(height: CGFloat(data[index])*20)
                                        .clipShape(Capsule())
                                        .padding(.horizontal, 5)
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
}

struct CashFlowChartView_Previews: PreviewProvider {
    static var previews: some View {
        CashFlowView()
    }
}
