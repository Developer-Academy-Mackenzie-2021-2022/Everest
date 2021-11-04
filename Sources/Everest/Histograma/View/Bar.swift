//
//  GraphView.swift
//
//
//  Created by Carolina Ortega on 03/11/21.
//

import SwiftUI

struct Bar: View {
    @State var color: Color
    var colorLabel: Color
    var textLabel: String

    var value: CGFloat
    var width: CGFloat
    
    var body: some View {
        HStack(alignment: .bottom){
            VStack {
                Text(textLabel)
                    .font(.caption)
                    .foregroundColor(colorLabel)
                ZStack(alignment: .bottom){
                    Rectangle()
                        .fill(color)
                        .frame(width: width, height: value)
                }
                
            }
        }
    }
}

