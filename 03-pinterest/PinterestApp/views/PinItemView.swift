//
//  PinItemView.swift
//  PinterestApp
//
//  Created by 김가영 on 2023/02/19.
//

import SwiftUI

struct PinItemView: View {
    let widthHeightRatio: CGFloat = 1.0
    let imageUrl: String
    @State var liked = false
    
    var likeButtonClicked: (Bool) -> Void
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            AsyncImage(url: URL(string: imageUrl),
                       content: { image in
                image.resizable()
            }, placeholder: {
                Color.gray
            })
            .cornerRadius(20.0)
            
            Button {
                liked.toggle()
                likeButtonClicked(liked)
            } label: {
                if liked {
                    Image(systemName: "heart.fill")
                } else {
                    Image(systemName: "heart")
                }
            }
            .padding()
        }
    }
}

struct PinItemView_Previews: PreviewProvider {
    static var previews: some View {
        PinItemView(imageUrl: "http://imgnews.naver.net/image/5401/2022/10/17/0000265824_001_20221017154603500.jpg",
                    likeButtonClicked: { _ in})
    }
}
