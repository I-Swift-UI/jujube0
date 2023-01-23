//
//  BlockButton.swift
//  01-kakaopay-main
//
//  Created by 김가영 on 2023/01/23.
//

import SwiftUI

struct BlockButton: View {
    private let block: Block
    private let backgroundColor: Color
    private let foregroundColor: Color
    
    init(block: Block, backgroundColor: Color = .blockGray, foregroundColor: Color = .white) {
        self.block = block
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(block.title)
                    .lineLimit(1)
                    .foregroundColor(foregroundColor)
                    .font(.title2)
                    .bold()
                if let subtitle = block.subtitle {
                    Text(subtitle)
                        .foregroundColor(foregroundColor)
                        .fontWeight(.light)
                }
                Spacer()
            }
            Spacer()
        }
        .roundedBackgroundGradient(color: backgroundColor)
    }
}

struct BlockButton_Previews: PreviewProvider {
    static var previews: some View {
        BlockButton(block: Model.startData.blocks[0])
            .previewLayout(.sizeThatFits)
    }
}
