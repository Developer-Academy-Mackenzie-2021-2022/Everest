//
//  File.swift
//
//
//  Created by Caroline Taus on 03/11/21.
//

import Foundation

extension DataNormalizer {


    
    
    func normalizePointsMatrix(_ data: [[CGPoint]], viewSize: CGSize) -> [[CGPoint]] {
        
        var numberOfLines: Int
        var sizesOfLines = [Int]()
        
        numberOfLines = data.count
        
        for line in data {
            sizesOfLines.append(line.count)
        }
        
        var newData = [CGPoint]()
        
        for line in data {
            for point in line {
                newData.append(point)
            }
        }
        
        let normalizedNewData = normalizePoints(newData, viewSize: viewSize)
        
        var normalizedMatrix = [[CGPoint]](repeating: [CGPoint](), count: numberOfLines)
        
        for i in 0..<numberOfLines {
            normalizedMatrix[i] = [CGPoint](repeating: CGPoint(x: 0, y: 0), count: sizesOfLines[i])
        }
        
        var count: Int = 0
        for i in 0..<numberOfLines {
            for j in 0..<sizesOfLines[i] {
                normalizedMatrix[i][j] = normalizedNewData[count]
                count += 1
            }
        }
       return normalizedMatrix
    }
    
    
    func normalizeLines(_ data: [Line], viewSize: CGSize) -> [Line] {
        var newData = [[CGPoint]]()
        
        for line in data {
            newData.append(line.points)
        }
        let normalizedPoints = normalizePointsMatrix(newData, viewSize: viewSize)
        
        var normalizedLines = [Line]()
        for i in 0..<normalizedPoints.count {
            normalizedLines.append(Line(points: normalizedPoints[i], lineTitle: data[i].lineTitle, color: data[i].color, lineWidth: data[i].lineWidth))
        }
        return normalizedLines
        
        
    }
    
}
