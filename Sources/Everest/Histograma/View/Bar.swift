//
//  GraphView.swift
//
//
//  Created by Carolina Ortega on 03/11/21.
//

import SwiftUI

struct Bar: View {
    @State public var color: Color
    public var value: CGFloat
    public var width: CGFloat
    
    var body: some View {
        HStack(alignment: .bottom){
            VStack {
                ZStack(alignment: .bottom){
                    Rectangle()
                        .fill(self.color)
                        .frame(width: self.width, height: self.value)
                }
                
            }
        }
    }
}
