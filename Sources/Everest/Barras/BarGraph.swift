//
//  ContentView.swift
//  grafico-De-Barras
//
//  Created by Felipe Leite on 28/10/21.
//

import SwiftUI

// Struct para mostrar o SingleGraph
struct BarChart: View {
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
                //                Text (titleBarGraph)
                //                    .position(x: 150, y: 40)
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

                                SingleGraphView(colorSingleBar: Color.color2, colorLabel: .black, textLabel: labelValuesOne[$0], cornerRadiusBar: 0, valueSingleBar: barValuesOne[$0], widthBar: (width - 100) / CGFloat(barValuesOne.count))

                            }
                        }
                    }
                }
            }
        }
    }
}

// Struct para mostrar o StackedGraph
struct BarChart2: View {
    var titleBarGraph: String = "Gráfico de barras empilhada"
    //valores para a primeira e segunda barra
    var barValuesOne: [CGFloat] = [80, 88, 70 , 97, 65]
    var barValuesTwo: [CGFloat] = [50, 34, 45 , 30, 10]
    //Palavras ou letras para a barra
    var labelValuesOne: [String] = ["A", "B", "C", "D", "E"]
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width - 40
            let height = geometry.size.height / 2
            let centerY = height
            let maxValueOneBar = barValuesOne.max() ?? 0
            
            ZStack(alignment: .center) {
                //                Text (titleBarGraph)
                //                    .position(x: 150, y: 40)
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

                                StackedGraphView(colorBarOne: Color.color7, colorBarTwo: Color.color1, colorLabel: .black, textLabel: labelValuesOne[$0], cornerRadiusBar: 5, valueBarOne: barValuesOne[$0], valueBarTwo: barValuesTwo[$0], widthBar: (width - 100) / CGFloat(barValuesOne.count))

                            }
                        }
                    }
                }
            }
        }
    }
}

// Struct para mostrar o SideGraph
struct BarChart3: View {
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
                //                Text (titleBarGraph)
                //                    .position(x: 150, y: 40)
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

                                SideGraphView(colorBarOne: Color.color6, colorBarTwo: Color.color5, colorLabel: .black, textLabelOne: labelValuesOne[$0], textLabelTwo: labelValuesTwo[$0], cornerRadiusBar: 0, valueBarOne: barValuesOne[$0], valueBarTwo: barValuesTwo[$0], widthBar: (width - 100) / CGFloat(barValuesOne.count + barValuesTwo.count))

                            }
                        }
                    }
                }
            }
        }
    }
}


struct BarChart4: View {
    var titleBarGraph: String = "Gráfico de barras simples"
    //valores para a barra
    var barValuesOne: [CGFloat] = [100 , 44, 59 , 80, 49, 87, 99, 27]
    //Palavras ou letras para a barra
    var labelValuesOne: [String] = []
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width - 40
            let height = geometry.size.height / 2
            let centerY = height
            let maxValueOneBar = barValuesOne.max() ?? 0
            
            ZStack(alignment: .center) {
                ZStack (alignment: .center) {
                    ZStack (alignment: .center) {
                        Text ("")
                            .position(x: 30, y: centerY-maxValueOneBar)
                            .font(.subheadline)
                        Text ("")
                            .position(x: width, y: centerY + 10)
                            .font(.subheadline)
                        
                        //                        Path {
                        //                            path in
                        //                            path.move(to: CGPoint(x: 40, y: centerY - maxValueOneBar))
                        //                            path.addLine(to: CGPoint(x: 40, y: centerY))
                        //                            path.addLine(to: CGPoint(x: width, y: centerY))
                        //                        }.stroke()
                        
                    }.offset(y: 57)
                    
                    
                    VStack {
                        HStack(alignment: .bottom, spacing: 10) {
                            ForEach(0..<barValuesOne.count, id: \.self) {

                                SingleGraphView(colorSingleBar: Color.color5, colorLabel: .black, textLabel: "", cornerRadiusBar: 20, valueSingleBar: barValuesOne[$0], widthBar: (width - 120) / CGFloat(barValuesOne.count))

                            }
                        }
                    }
                }
            }
        }
    }
}

// Struct para mostrar o SideGraph
struct BarChart5: View {
    var titleBarGraph: String = "Gráfico de barras lado a lado"
    //valores para a primeira e segunda barra
    var barValuesOne: [CGFloat] = [50, 60, 70 , 80, 90]
    var barValuesTwo: [CGFloat] = [100, 50, 40 , 30, 10]
    var barValuesThree: [CGFloat] = [10, 40, 30 , 20, 100]
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
                //                Text (titleBarGraph)
                //                    .position(x: 150, y: 40)
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

                                SideGraphView3(colorBarOne: Color.color4, colorBarTwo: Color.color1, colorBarThree: Color.color3, colorLabel: .black, textLabelOne: "\(Int(barValuesOne[$0]))", textLabelTwo: "\(Int(barValuesTwo[$0]))", textLabelThree: "\(Int(barValuesThree[$0]))", cornerRadiusBar: 3, valueBarOne: barValuesOne[$0], valueBarTwo: barValuesTwo[$0], valueBarThree: barValuesThree[$0], widthBar: (width - 100) / CGFloat(barValuesOne.count + barValuesTwo.count + barValuesThree.count ))

                            }
                        }
                    }
                }
            }
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChart()
        BarChart2()
        BarChart3()
        BarChart4()
        BarChart5()
    }
    
}

//let normalizer: DataNormalizer = DataNormalizer()
//normalizer.normalizePoints([], viewSize: Size)
