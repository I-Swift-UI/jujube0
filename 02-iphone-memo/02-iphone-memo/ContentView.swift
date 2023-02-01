//
//  ContentView.swift
//  02-iphone-memo
//
//  Created by 김가영 on 2023/01/28.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject private var items: MemoList
    
    init(items: MemoList) {
        self.items = items
    }
    
    

    var body: some View {
        VStack {
            List {
                ForEach(items.list) { item in
                    MemoRow(memoItem: item)
                }
            }
            
            Spacer()
            ZStack(alignment: .trailing) {
                Text("\(items.list.count)개의 메모")
                    .frame(maxWidth: .infinity)
                Button(action: {
                    addItem()
                }) {
                    Image(systemName: "square.and.pencil")
                }
                .padding(.trailing)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
    
    private func addItem() {
        items.list.append(MemoItem(title: "새로운 아이템", content: "새로운 아이템", updatedAt: .now))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(items: MemoList(MemoItem.sampleList))
    }
}
