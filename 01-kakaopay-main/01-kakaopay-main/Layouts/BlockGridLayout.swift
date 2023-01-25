//
//  BlockGridLayout.swift
//  01-kakaopay-main
//
//  Created by 김가영 on 2023/01/23.
//

import SwiftUI

struct BlockGridLayout: Layout {
    
    static let numberOfSubviewsInGroup = 4
    
    // for a group
    private let widthHeightRatio = 1.2
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let width = proposal.replacingUnspecifiedDimensions().width // unspecified일 경우 10으로 값을 고정
        let groupCount = subviews.count / Self.numberOfSubviewsInGroup
        
        var height = CGFloat(groupCount) * width * widthHeightRatio
        if subviews.count % Self.numberOfSubviewsInGroup > 0 {
            height += width * widthHeightRatio * 2/3
        }
        return CGSize(width: width, height: height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        subviews.enumerated().forEach { index, subview in
            subview.place(at: getOrigin(in: bounds, subviewAt: index),
                          proposal: getProposal(subviewAt: index, width: bounds.width))
        }
    }
    
    private func getProposal(subviewAt index: Int, width: CGFloat) -> ProposedViewSize {
        let height = width * widthHeightRatio
        switch index % Self.numberOfSubviewsInGroup {
        case 0:         return ProposedViewSize(width: width/3*2, height: height/3*2)
        case 1, 2:      return ProposedViewSize(width: width/3, height: height/3)
        case 3:         return ProposedViewSize(width: width, height: height/3)
        default:        return .zero
        }
    }
    
    private func getOrigin(in bounds: CGRect, subviewAt index: Int) -> CGPoint {
        let groupIndex = index / Self.numberOfSubviewsInGroup
        let startY = bounds.minY + CGFloat(groupIndex) * bounds.width * widthHeightRatio
        switch index % Self.numberOfSubviewsInGroup {
        case 0:         return CGPoint(x: bounds.minX, y: startY)
        case 1:         return CGPoint(x: bounds.minX + bounds.width/3*2, y: startY)
        case 2:         return CGPoint(x: bounds.minX + bounds.width/3*2, y: startY + bounds.width * widthHeightRatio / 3)
        case 3:         return CGPoint(x: bounds.minX, y: startY + bounds.width * widthHeightRatio / 3 * 2)
        default:        return bounds.origin
        }
    }
}
