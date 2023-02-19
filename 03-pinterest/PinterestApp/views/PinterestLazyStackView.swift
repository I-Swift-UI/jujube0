//
//  PinterestLazyStackView.swift
//  PinterestApp
//
//  Created by 김가영 on 2023/02/04.
//

import SwiftUI

struct PinterestLazyStackView: View {
    var pinList: [PinModel]
    private let spacing = 10.0
    
    @Binding var didReachEnd: Bool
    
    var body: some View {
        LazyVStack(spacing: spacing) {
            ForEach(pinList) { item in
                PinItemView(imageUrl: item.image)
                    .aspectRatio(item.widthHeightRatio, contentMode: .fill)
                
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
        PinterestLazyStackView(pinList: PinModel.sampleListData,
                               didReachEnd: .constant(false))
    }
}

struct PinItemView: View {
    let widthHeightRatio: CGFloat = 1.0
    let imageUrl: String
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: imageUrl),
                       content: { image in
                image.resizable()
            }, placeholder: {
                Color.gray
            })
            .cornerRadius(20.0)
        }
    }
}
