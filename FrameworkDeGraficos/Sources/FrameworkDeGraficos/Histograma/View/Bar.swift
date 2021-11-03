//
//  Bar.swift
//  
//
//  Created by Carolina Ortega on 03/11/21.
//

import SwiftUI

struct Bar: View {
    @State var color: Color
    var value: CGFloat
    var width: CGFloat
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: width, height: value)
    }
}

