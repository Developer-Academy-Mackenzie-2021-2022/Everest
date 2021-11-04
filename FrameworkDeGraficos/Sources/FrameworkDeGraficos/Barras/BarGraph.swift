//
//  ContentView.swift
//  grafico-De-Barras
//
//  Created by Felipe Leite on 28/10/21.
//

import SwiftUI

// Struct para mostrar o SingleGraph
struct ContentView: View {
    var titleBarGraph: String = "Gráfico de barras simples"
    //valores para a barra
    var barValuesOne: [CGFloat] = [50, 60, 70 , 80, 90]
    //Palavras ou letras para a barra
    var labelValuesOne: [String] = ["A", "B", "C", "D", "E"]
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width - 40
            let height = geometry.size.height / 2
            let centerY = height
            let maxValueOneBar = barValuesOne.max() ?? 0
            
            ZStack(alignment: .center) {
                Text (titleBarGraph)
                    .position(x: 150, y: 40)
                ZStack (alignment: .center) {
                    ZStack (alignment: .center) {
                        Text ("Y")
                            .position(x: 30, y: centerY-maxValueOneBar)
                            .font(.subheadline)
                        Text ("X")
                            .position(x: width, y: centerY + 10)
                            .font(.subheadline)
                        
                        Path {
                            path in
                            path.move(to: CGPoint(x: 40, y: centerY - maxValueOneBar))
                            path.addLine(to: CGPoint(x: 40, y: centerY))
                            path.addLine(to: CGPoint(x: width, y: centerY))
                        }.stroke()
                        
                    }.offset(y: 57)
                    
                    
                    VStack {
                        HStack(alignment: .bottom, spacing: 10) {
                            ForEach(0..<barValuesOne.count, id: \.self) {
                                SingleGraphView(colorSingleBar: .pink, colorLabel: .black, textLabel: labelValuesOne[$0], cornerRadiusBar: 0, valueSingleBar: barValuesOne[$0], widthBar: (width - 100) / CGFloat(barValuesOne.count))
                            }
                        }
                    }
                }
            }
        }
    }
}

// Struct para mostrar o StackedGraph
struct ContentView2: View {
    var titleBarGraph: String = "Gráfico de barras empilhada"
    //valores para a primeira e segunda barra
    var barValuesOne: [CGFloat] = [50, 60, 70 , 80, 90]
    var barValuesTwo: [CGFloat] = [100, 50, 40 , 30, 10]
    //Palavras ou letras para a barra
    var labelValuesOne: [String] = ["A", "B", "C", "D", "E"]
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width - 40
            let height = geometry.size.height / 2
            let centerY = height
            let maxValueOneBar = barValuesOne.max() ?? 0
            
            ZStack(alignment: .center) {
                Text (titleBarGraph)
                    .position(x: 150, y: 40)
                ZStack (alignment: .center) {
                    ZStack (alignment: .center) {
                        Text ("Y")
                            .position(x: 30, y: centerY-maxValueOneBar)
                            .font(.subheadline)
                        Text ("X")
                            .position(x: width, y: centerY + 10)
                            .font(.subheadline)
                        
                        Path {
                            path in
                            path.move(to: CGPoint(x: 40, y: centerY - maxValueOneBar))
                            path.addLine(to: CGPoint(x: 40, y: centerY))
                            path.addLine(to: CGPoint(x: width, y: centerY))
                        }.stroke()
                        
                    }.offset(y: 62)
                    
                    VStack {
                        HStack(alignment: .bottom, spacing: 10) {
                            ForEach(0..<barValuesOne.count, id: \.self) {
                                StackedGraphView(colorBarOne: .red, colorBarTwo: .blue, colorLabel: .black, textLabel: labelValuesOne[$0], cornerRadiusBar: 0, valueBarOne: barValuesOne[$0], valueBarTwo: barValuesTwo[$0], widthBar: (width - 100) / CGFloat(barValuesOne.count))
                            }
                        }
                    }
                }
            }
        }
    }
}

// Struct para mostrar o SideGraph
struct ContentView3: View {
    var titleBarGraph: String = "Gráfico de barras lado a lado"
    //valores para a primeira e segunda barra
    var barValuesOne: [CGFloat] = [50, 60, 70 , 80, 90]
    var barValuesTwo: [CGFloat] = [100, 50, 40 , 30, 10]
    //Palavras ou letras para a primeira e segunda barra
    var labelValuesOne: [String] = ["A", "B", "C", "D", "E"]
    var labelValuesTwo: [String] = ["E", "D", "P", "B", "A"]
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width - 40
            let height = geometry.size.height / 2
            let centerY = height
            let maxValueOneBar = barValuesOne.max() ?? 0
            ZStack(alignment: .center) {
                Text (titleBarGraph)
                    .position(x: 150, y: 40)
                ZStack(alignment: .center) {
                    ZStack (alignment: .center) {
                        Text ("Y")
                            .position(x: 30, y: centerY-maxValueOneBar)
                            .font(.subheadline)
                        Text ("X")
                            .position(x: width, y: centerY + 10)
                            .font(.subheadline)
                        Path {
                            path in
                            path.move(to: CGPoint(x: 40, y: centerY - maxValueOneBar))
                            path.addLine(to: CGPoint(x: 40, y: centerY))
                            path.addLine(to: CGPoint(x: width, y: centerY))
                        }.stroke()
                    } .offset(y: 62)
                    VStack {
                        HStack(alignment: .bottom, spacing: 10) {
                            ForEach(0..<barValuesOne.count, id: \.self) {
                                SideGraphView(colorBarOne: .blue, colorBarTwo: .pink, colorLabel: .black, textLabelOne: labelValuesOne[$0], textLabelTwo: labelValuesTwo[$0], cornerRadiusBar: 0, valueBarOne: barValuesOne[$0], valueBarTwo: barValuesTwo[$0], widthBar: (width - 100) / CGFloat(barValuesOne.count + barValuesTwo.count))
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView2()
        ContentView3()
    }
    
}
