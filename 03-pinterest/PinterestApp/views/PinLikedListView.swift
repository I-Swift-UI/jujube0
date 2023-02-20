//
//  PinLikedListView.swift
//  PinterestApp
//
//  Created by 김가영 on 2023/02/19.
//

import SwiftUI

struct PinLikedListView: View {
    @ObservedObject var likedPinListViewModel: LikedPinListViewModel
    private let columnSize = 2
    
    private var pinModelList: [[PinItem]] {
        var list: [[PinItem]] = .init(repeating: [], count: columnSize)
        var moderator: CGFloat = 0
        likedPinListViewModel.likedPinList.enumerated().forEach { i, item in
            if moderator <= 0 {
                moderator += 1/item.widthHeightRatio
                list[0].append(item)
            } else {
                moderator -= 1/item.widthHeightRatio
                list[1].append(item)
            }
        }
        return list
    }
    
    @State var didReachEnd = true
    
    var body: some View {
        ScrollView {
            HStack(alignment: .top) {
                ForEach(0..<columnSize, id: \.self) { i in
                    PinterestLazyStackView(pinList: pinModelList[i],
                                           likeButtonClicked: { item, _ in
                        likedPinListViewModel.removePinItem(item)
                    },
                                            didReachEnd: $didReachEnd)
                }
            }
        }
        .padding(4)
    }
}

struct PinLikedListView_Previews: PreviewProvider {
    static var previews: some View {
        PinLikedListView(likedPinListViewModel: .init(likedPinList: PinItem.sampleListData))
    }
}
