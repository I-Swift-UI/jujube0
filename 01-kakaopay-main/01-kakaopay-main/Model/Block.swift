//
//  Block.swift
//  01-kakaopay-main
//
//  Created by 김가영 on 2023/01/23.
//

import SwiftUI

struct Block: Identifiable, Equatable {
    let id: UUID
    let title: String
    let subtitle: String?
    
    init(title: String, subtitle: String?) {
        self.id = UUID()
        self.title = title
        self.subtitle = subtitle
    }
}
