//
//  PinItem.swift
//  PinterestApp
//
//  Created by 김가영 on 2023/02/04.
//

import Foundation
import Combine

struct PinItem: Identifiable, Hashable {
    let id: UUID = UUID()
    let widthHeightRatio: CGFloat
    let image: String
    var liked: Bool = false
    
}

extension PinItem {
    static var sampleListData: [Self] {
        [PinItem(widthHeightRatio: 1.0, image: "http://imgnews.naver.net/image/5401/2022/10/17/0000265824_001_20221017154603500.jpg"),
         PinItem(widthHeightRatio: 1.5, image: "http://imgnews.naver.net/image/5401/2022/10/17/0000265824_001_20221017154603500.jpg")]
    }
}
