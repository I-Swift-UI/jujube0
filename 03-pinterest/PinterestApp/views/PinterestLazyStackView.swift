//
//  PinterestLazyStackView.swift
//  PinterestApp
//
//  Created by 김가영 on 2023/02/04.
//

import SwiftUI

struct PinterestLazyStackView: View {
    var pinList: [PinModel]
    private let spacing = 20.0
    
    @Binding var didReachEnd: Bool
    
    var body: some View {
        LazyVStack(spacing: spacing) {
            ForEach(pinList) { item in
                PinItemView()
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
        PinterestLazyStackView(pinList: PinModel.sampleListData, didReachEnd: .constant(false))
    }
}

struct PinItemView: View {
    let widthHeightRatio: CGFloat = 1.0
    var body: some View {
        Rectangle()
            .foregroundColor(.teal)
            .cornerRadius(20.0)
    }
}
