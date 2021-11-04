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
            HStack(alignment: .bottom, spacing: 1){
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

struct SideGraphView3: View {
    @State
    var colorBarOne: Color
    var colorBarTwo: Color
    var colorBarThree: Color
    var colorLabel: Color
    var textLabelOne: String
    var textLabelTwo: String
    var textLabelThree: String
    var cornerRadiusBar: CGFloat
    var valueBarOne: CGFloat
    var valueBarTwo: CGFloat
    var valueBarThree: CGFloat
    var widthBar: CGFloat
    
    var body: some View {
        HStack{
            HStack(alignment: .bottom, spacing: 1){
                VStack{
                    Text(textLabelOne)
                        .font(.caption2)
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
                        .font(.caption2)
                        .foregroundColor(colorLabel)
                    ZStack(alignment: .bottom){
                        Rectangle()
                            .fill(colorBarTwo)
                            .frame(width: widthBar, height: valueBarTwo)
                            .cornerRadius(cornerRadiusBar)
                    }
                    
                }
                VStack {
                    Text(textLabelThree)
                        .font(.caption2)
                        .foregroundColor(colorLabel)
                    ZStack(alignment: .bottom){
                        Rectangle()
                            .fill(colorBarThree)
                            .frame(width: widthBar, height: valueBarThree)
                            .cornerRadius(cornerRadiusBar)
                    }
                }
            }
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        SideGraphView(colorBarOne: .blue, colorBarTwo: .red, colorLabel: .black, textLabelOne: "A", textLabelTwo: "B", cornerRadiusBar: 5, valueBarOne: 10, valueBarTwo: 20, widthBar: 20)
    }
}
//Hstack alignment bottom spacing 5
//ForEach
//Hstack alignment bottom spacing 1

