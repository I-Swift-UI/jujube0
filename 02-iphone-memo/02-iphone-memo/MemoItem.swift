//
//  MemoItem.swift
//  02-iphone-memo
//
//  Created by 김가영 on 2023/02/01.
//

import Foundation

class MemoList: ObservableObject{
    @Published var list: [MemoItem]
    
    init(_ list: [MemoItem]) {
        self.list = list
    }
}

struct MemoItem: Identifiable {
    let id: UUID
    var title: String
    var content: String
    var updatedAt: Date
    
    init(title: String, content: String, updatedAt: Date) {
        self.id = UUID()
        self.title = title
        self.content = content
        self.updatedAt = updatedAt
    }
}

// Preview
extension MemoItem {
    static var sampleList: [MemoItem] {
        [MemoItem(title: "살 것", content: "김치, 물, 라면 글씨가 길어지면 어떻게 되나요 하하하하하하하하ㅏ하하하", updatedAt: .now),
         MemoItem(title: "팔 것", content: "김치, 물, 라면", updatedAt: .now),
         MemoItem(title: "먹을 것", content: "김치, 물, 라면", updatedAt: .now)]
    }
    
    static var sampleItem: MemoItem {
        sampleList.first!
    }
    
    
}
