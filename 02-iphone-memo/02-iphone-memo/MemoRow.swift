//
//  MemoRow.swift
//  02-iphone-memo
//
//  Created by 김가영 on 2023/02/01.
//

import SwiftUI

struct MemoRow: View {
    let memoItem: MemoItem
    var body: some View {
        VStack(alignment: .leading, spacing: 3.0) {
            Text(memoItem.title)
                .bold()
                .lineLimit(1)
            HStack {
                Group {
                    Text(memoItem.updatedAt, formatter: itemFormatter)
                    Text(memoItem.content)
                }
                .font(.caption)
                .lineLimit(1)
            }
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct MemoRow_Previews: PreviewProvider {
    static var previews: some View {
        MemoRow(memoItem: MemoItem.sampleItem)
            .previewLayout(.sizeThatFits)
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
