//
//  BlockGrid.swift
//  01-kakaopay-main
//
//  Created by 김가영 on 2023/01/23.
//

import SwiftUI

struct BlockGrid: View {
    @EnvironmentObject private var model: Model
    
    private var blocks: [Block?] {
        model.blocks + Array(repeating: nil,
                             count: (BlockGridLayout.numberOfSubviewsInGroup - model.blocks.count % BlockGridLayout.numberOfSubviewsInGroup))
    }
    
    var body: some View {
        BlockGridLayout {
            ForEach(Array(blocks.enumerated()),
                    id: \.offset) { i, block in
                if let block = block {
                    createBlockButton(block: block, index: i)
                } else {
                    EmptyBlockButton(backgroundColor: i == 0 ? .blockOrange : .blockGray)
                }
            }.padding(3)
        }
    }
    
    private func createBlockButton(block: Block, index: Int) -> BlockButton {
        BlockButton(block: block,
                    backgroundColor: index == 0 ? .blockOrange : .blockGray,
                    foregroundColor: index == 0 ? .black : .white)
    }
    
}

struct BlockGrid_Previews: PreviewProvider {
    static var previews: some View {
        BlockGrid()
            .environmentObject(Model.startData)
    }
}
