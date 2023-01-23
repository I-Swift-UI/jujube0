//
//  EmptyBlockButton.swift
//  01-kakaopay-main
//
//  Created by 김가영 on 2023/01/23.
//

import SwiftUI

struct EmptyBlockButton: View {
    private let backgroundColor: Color
    
    init(backgroundColor: Color) {
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        Image(systemName: "plus.circle")
            .font(.title)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .roundedBackgroundGradient(color: backgroundColor)
    }
}

struct EmptyBlockButton_Previews: PreviewProvider {
    static var previews: some View {
        EmptyBlockButton(backgroundColor: .blockGray)
    }
}
