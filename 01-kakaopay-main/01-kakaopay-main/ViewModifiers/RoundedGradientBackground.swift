//
//  RoundedGradientBackground.swift
//  01-kakaopay-main
//
//  Created by 김가영 on 2023/01/23.
//

import SwiftUI

struct RoundedGradientBackground: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(colors: [color, color.darker()], startPoint: .zero, endPoint: .bottomTrailing))
            .cornerRadius(10)
    }
}

extension View {
    func roundedBackgroundGradient(color: Color) -> some View {
        modifier(RoundedGradientBackground(color: color))
    }
}
