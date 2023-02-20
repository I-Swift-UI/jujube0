//
//  PinterestLazyStackView.swift
//  PinterestApp
//
//  Created by 김가영 on 2023/02/04.
//

import SwiftUI

struct PinterestLazyStackView: View {
    var pinList: [PinItem]
    private let spacing = 10.0
    
    var likeButtonClicked: (PinItem, Bool) -> Void
    
    @Binding var didReachEnd: Bool
    
    var body: some View {
        LazyVStack(spacing: spacing) {
            ForEach(pinList) { item in
                ZStack(alignment: .topTrailing) {
                    PinItemView(imageUrl: item.image, liked: item.liked, likeButtonClicked: {
                        likeButtonClicked(item, !item.liked)
                    })
                    .aspectRatio(item.widthHeightRatio, contentMode: .fill)
                }
            }
            
            Color.clear
                .frame(width: 0, height: 0)
                .onAppear {
                    didReachEnd = true
                }
        }
    }
}

struct PinterestLazyStackView_Previews: PreviewProvider {
    static var previews: some View {
        PinterestLazyStackView(pinList: PinItem.sampleListData,
                               likeButtonClicked: { _, _ in },
                               didReachEnd: .constant(false))
    }
}
