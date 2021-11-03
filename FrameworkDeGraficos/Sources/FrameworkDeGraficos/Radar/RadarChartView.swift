import SwiftUI
import SpriteKit

struct RadarChartView: View {
    var data: [[Double]]
    var size: Double
    var colors: [Color]
    var gridSize: Int
    var labels: [String]
    
    public init(data: [[Double]],
                size: Double,
                colors: [Color] = [Color(red: 0xF5 / 255, green: 0x45 / 255, blue: 0x4F / 255),
                                   Color(red: 0xF4 / 255, green: 0x96 / 255, blue: 0x3F / 255),
                                   Color(red: 0x92 / 255, green: 0xBC / 255, blue: 0x75 / 255),
                                   Color(red: 0x59 / 255, green: 0x77 / 255, blue: 0x8E / 255),
                                   Color(red: 0xEF / 255, green: 0x72 / 255, blue: 0x41 / 255),
                                   Color(red: 0xF7 / 255, green: 0xC5 / 255, blue: 0x63 / 255),
                                   Color(red: 0x4D / 255, green: 0xA8 / 255, blue: 0x8D / 255),],
                gridSize: Int,
                labels: [String]) {
        self.data = data
        self.size = size
        self.colors = colors
        self.gridSize = gridSize
        self.labels = labels
    }
    
    var body: some View {
        HStack {
            ZStack {
                // Grid
                RadarGridView(gridSize: gridSize, sides: data[0].count, size: size)
                
                // Lines
                RadarGridAxis(sides: data[0].count, size: size)
                    .stroke(.black)
                
                ForEach(0..<data.count) {
                    RadarLine(data: data[$0])
                        .stroke(colors[$0], lineWidth: 2)
                        .background(RadarLine(data: data[$0]).fill(colors[$0].opacity(0.33)))
                        .frame(width: size, height: size, alignment: .center)
                }
                
                RadarLabelsView(labels: labels, size: size)
                    .edgesIgnoringSafeArea(.vertical)
            }
            
        }
    }
}

struct RadarChartView_Previews: PreviewProvider {
    static var previews: some View {
        let data: [[Double]] = [
            [0.8, 1, 0.6, 0.7, 0.9, 0.5],
            [0.3, 0.4, 0.1, 0.7, 0.3, 0.8],
            [0.2, 0.1, 0.6, 0.5, 0.9, 0.4],
            [0.8, 0.9, 0.4, 0.3, 0.4, 0.6],
            [0.4, 0.6, 0.9, 0.1, 0.5, 0.7],
        ]
        let labels: [String] = [
            "Strength",
            "Constitution",
            "Wisdom",
            "Intelligence",
            "Charisma",
            "Dexterity"
        ]
        RadarChartView(data: data, size: 100, gridSize: 4, labels: labels)
    }
}
