//
//  Model.swift
//  01-kakaopay-main
//
//  Created by 김가영 on 2023/01/23.
//

import SwiftUI

class Model: ObservableObject {
    
    @Published var blocks: [Block]
    
    init(blocks: [Block]) {
        self.blocks = blocks
    }
}

extension Model {
    static var startData: Model = Model(blocks: [
        Block(title: "2,764원", subtitle: "카카오페이머니"),
        Block(title: "선택하기", subtitle: "송금"),
        Block(title: "신한카드", subtitle: "결제"),
        Block(title: "Spotify AB", subtitle: "11,990원"),
        Block(title: "2,764원", subtitle: "카카오페이머니"),
        Block(title: "선택하기", subtitle: "송금"),
    ])
}
