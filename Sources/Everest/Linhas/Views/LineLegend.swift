//
//  SwiftUIView.swift
//  
//
//  Created by Caroline Taus on 04/11/21.
//

import SwiftUI

struct LineLegendView: View {
    @State
    var color: Color
    @State
    var legendText: String
    
    
    var body: some View {
        
        HStack {
            Rectangle()
                .fill(color)
                .frame(width: 15, height: 15, alignment: .center)
            Text(legendText)
                .font(.subheadline)
        }
    }
    
}

struct SwiftUIViewLineLegend_Previews: PreviewProvider {
    static var previews: some View {
        LineLegendView(color: Color.red, legendText: "toti")
    }
}
