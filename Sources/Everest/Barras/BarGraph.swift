//
//  ContentView.swift
//  grafico-De-Barras
//
//  Created by Felipe Leite on 28/10/21.
//

import SwiftUI

// Struct para mostrar o SingleGraph
public struct BarChart: View {
    var titleBarGraph: String
    //valores para a barra
    var barValuesOne: [CGFloat]
    //Palavras ou letras para a barra
    var labelValuesOne: [String]
    
    public init (
        titleBarGraph: String = "Gráfico de barras simples", barValuesOne: [CGFloat] = [50, 60, 70 , 80, 90], labelValuesOne: [String] = ["A", "B", "C", "D", "E"]
    ){
        self.titleBarGraph = titleBarGraph
        self.barValuesOne = barValuesOne
        self.labelValuesOne = labelValuesOne
        
    }
    
    public var body: some View {
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
public struct BarChart2: View {
    var titleBarGraph: String
    //valores para a primeira e segunda barra
    var barValuesOne: [CGFloat]
    var barValuesTwo: [CGFloat]
    //Palavras ou letras para a barra
    var labelValuesOne: [String]
    
    public init (
        titleBarGraph: String = "Gráfico de barras simples", barValuesOne: [CGFloat] = [80, 88, 70 , 97, 65], barValuesTwo: [CGFloat] = [50, 34, 45 , 30, 10], labelValuesOne: [String] = ["A", "B", "C", "D", "E"]
    ){
        self.titleBarGraph = titleBarGraph
        self.barValuesOne = barValuesOne
        self.barValuesTwo = barValuesTwo
        self.labelValuesOne = labelValuesOne
        
    }
    
    public var body: some View {
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
public struct BarChart3: View {
    var titleBarGraph: String
    //valores para a primeira e segunda barra
    var barValuesOne: [CGFloat]
    var barValuesTwo: [CGFloat]
    //Palavras ou letras para a primeira e segunda barra
    var labelValuesOne: [String]
    var labelValuesTwo: [String]
    
    public init (
        titleBarGraph: String = "Gráfico de barras simples", barValuesOne: [CGFloat] = [50, 60, 70 , 80, 90], barValuesTwo: [CGFloat] = [50, 34, 45 , 30, 10], labelValuesOne: [String] = ["A", "B", "C", "D", "E"], labelValuesTwo: [String] = ["E", "D", "P", "B", "A"]
    ){
        self.titleBarGraph = titleBarGraph
        self.barValuesOne = barValuesOne
        self.barValuesTwo = barValuesTwo
        self.labelValuesOne = labelValuesOne
        self.labelValuesTwo = labelValuesTwo
        
    }
    
    public var body: some View {
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


public struct BarChart4: View {
    var titleBarGraph: String
    //valores para a barra
    var barValuesOne: [CGFloat]
    //Palavras ou letras para a barra
    var labelValuesOne: [String]
    
    public init (
        titleBarGraph: String = "Gráfico de barras simples", barValuesOne: [CGFloat] = [100 , 44, 59 , 80, 49, 87, 99, 27], labelValuesOne: [String] = []
    ){
        self.titleBarGraph = titleBarGraph
        self.barValuesOne = barValuesOne
        self.labelValuesOne = labelValuesOne
        
        
    }
    
    public var body: some View {
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
public struct BarChart5: View {
    var titleBarGraph: String
    //valores para a primeira e segunda barra
    var barValuesOne: [CGFloat]
    var barValuesTwo: [CGFloat]
    var barValuesThree: [CGFloat]
    //Palavras ou letras para a primeira e segunda barra
    
    public init (
        titleBarGraph: String = "Gráfico de barras simples", barValuesOne: [CGFloat] = [50, 60, 70 , 80, 90], barValuesTwo: [CGFloat] = [100, 50, 40 , 30, 10], barValuesThree: [CGFloat] = [10, 40, 30 , 20, 100]
    ){
        self.titleBarGraph = titleBarGraph
        self.barValuesOne = barValuesOne
        self.barValuesTwo = barValuesTwo
        self.barValuesThree = barValuesThree
        
    }
    
    public var body: some View {
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
