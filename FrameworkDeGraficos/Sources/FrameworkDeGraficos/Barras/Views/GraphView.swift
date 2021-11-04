//
//  GraphView.swift
//  grafico-De-Barras
//
//  Created by Felipe Leite on 28/10/21.
//

import SwiftUI

struct SingleGraphView: View {
    @State
    var colorSingleBar: Color
    var colorLabel: Color
    var textLabel: String
    var cornerRadiusBar: CGFloat
    var valueSingleBar: CGFloat
    var widthBar: CGFloat
    
    var body: some View {
        HStack(alignment: .bottom){
            VStack {
                Text(textLabel)
                    .font(.caption)
                    .foregroundColor(colorLabel)
                ZStack(alignment: .bottom){
                    Rectangle()
                        .fill(colorSingleBar)
                        .frame(width: widthBar, height: valueSingleBar)
                        .cornerRadius(cornerRadiusBar)
                }
                
            }
        }
    }
}


struct StackedGraphView: View {
    @State
    var colorBarOne: Color
    var colorBarTwo: Color
    var colorLabel: Color
    var textLabel: String
    var cornerRadiusBar: CGFloat
    var valueBarOne: CGFloat
    var valueBarTwo: CGFloat
    var widthBar: CGFloat
    
    var body: some View {
        HStack(alignment: .bottom){
            VStack {
                Text(textLabel)
                    .font(.caption)
                    .foregroundColor(colorLabel)
                ZStack(alignment: .bottom){
                    Rectangle()
                        .fill(colorBarOne)
                        .frame(width: widthBar, height: valueBarOne)
                        .cornerRadius(cornerRadiusBar)
                    Rectangle()
                        .fill(colorBarTwo)
                        .frame(width: widthBar, height: valueBarTwo)
                        .cornerRadius(cornerRadiusBar)
                }
                
            }
        }
    }
}

struct SideGraphView: View {
    @State
    var colorBarOne: Color
    var colorBarTwo: Color
    var colorLabel: Color
    var textLabelOne: String
    var textLabelTwo: String
    var cornerRadiusBar: CGFloat
    var valueBarOne: CGFloat
    var valueBarTwo: CGFloat
    var widthBar: CGFloat
    
    var body: some View {
        HStack{
            HStack(alignment: .bottom, spacing: 2){
                VStack{
                    Text(textLabelOne)
                        .font(.caption)
                        .foregroundColor(colorLabel)
                    ZStack(alignment: .bottom){
                        Rectangle()
                            .fill(colorBarOne)
                            .frame(width: widthBar, height: valueBarOne)
                            .cornerRadius(cornerRadiusBar)
                    }
                }
                
                VStack {
                    Text(textLabelTwo)
                        .font(.caption)
                        .foregroundColor(colorLabel)
                    ZStack(alignment: .bottom){
                        Rectangle()
                            .fill(colorBarTwo)
                            .frame(width: widthBar, height: valueBarTwo)
                            .cornerRadius(cornerRadiusBar)
                    }
                    
                }
            }
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        SideGraphView(colorBarOne: .blue, colorBarTwo: .red, colorLabel: .white, textLabelOne: "A", textLabelTwo: "B", cornerRadiusBar: 5, valueBarOne: 10, valueBarTwo: 20, widthBar: 20)
    }
}
