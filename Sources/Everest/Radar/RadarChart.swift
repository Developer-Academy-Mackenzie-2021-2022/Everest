import SwiftUI

public struct RadarChart: View {
    var data: [[Double]] = []
    var size: Double
    var colors: [Color]
    var gridSize: Int
    var labels: [String]
    
    public init(data: [[Double]],
                size: Double = 100,
                colors: [Color] = [Color(red: 0xF5 / 255, green: 0x45 / 255, blue: 0x4F / 255),
                                   Color(red: 0xF4 / 255, green: 0x96 / 255, blue: 0x3F / 255),
                                   Color(red: 0x92 / 255, green: 0xBC / 255, blue: 0x75 / 255),
                                   Color(red: 0x59 / 255, green: 0x77 / 255, blue: 0x8E / 255),
                                   Color(red: 0xEF / 255, green: 0x72 / 255, blue: 0x41 / 255),
                                   Color(red: 0xF7 / 255, green: 0xC5 / 255, blue: 0x63 / 255),
                                   Color(red: 0x4D / 255, green: 0xA8 / 255, blue: 0x8D / 255),],
                gridSize: Int = 4,
                labels: [String] = []) {
        
        self.size = size
        self.colors = colors
        self.gridSize = gridSize
        self.labels = labels
        
        for i in 0..<data.count {
            let totalValue = findTotalValue(data: data[i])
            var linePoints: [Double] = []
            for data in data[i] {
                linePoints.append(DataNormalizer.shared.normalizeByScaleFactor(data, scaleFactor: 1 / totalValue))
            }
            self.data.append(linePoints)
        }
    }
    
    public var body: some View {
        HStack {
            ZStack {
                // Grid
                RadarGridView(gridSize: gridSize, sides: data[0].count, size: size)
                
                // Lines
                RadarGridAxis(sides: data[0].count, size: size)
                    .stroke(.black)
                
                ForEach(0..<data.count) {
                    RadarLine(data: data[$0])
                        .stroke(colors[($0)%colors.count], lineWidth: 2)
                        .background(RadarLine(data: data[$0]).fill(colors[($0)%colors.count].opacity(0.33)))
                        .frame(width: size, height: size, alignment: .center)
                }
                
                if labels.count > 0 {
                    RadarLabelsView(labels: labels, size: size)
                        .edgesIgnoringSafeArea(.vertical)
                }
            }
            
        }
    }
    
    private func findTotalValue(data: [Double]) -> Double {
        var max = data[0]
        for d in data {
            if d > max {
                max = d
            }
        }
        return max
    }
}

struct RadarChart_Previews: PreviewProvider {
    static var previews: some View {
        let data: [[Double]] = [
            [15, 23, 14, 20, 8, 3],
        ]
        let labels: [String] = [
            "Strength",
            "Constitution",
            "Wisdom",
            "Intelligence",
            "Charisma",
            "Dexterity"
        ]
        RadarChart(data: data, labels: labels)
    }
}
