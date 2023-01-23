//
//  BlockGridLayout.swift
//  01-kakaopay-main
//
//  Created by 김가영 on 2023/01/23.
//

import SwiftUI

struct BlockGridLayout: Layout {
    
    static let subviewCount = 4
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        guard subviews.count == Self.subviewCount else { return .zero }
        return proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        guard subviews.count == Self.subviewCount else { return }
        
        let firstViewProposal = ProposedViewSize(width: bounds.width/3*2, height: bounds.height/3*2)
        subviews[0].place(at: CGPoint(x: bounds.minX, y: bounds.minY), proposal: firstViewProposal)
        
        let secondViewProposal = ProposedViewSize(width: bounds.width/3, height: bounds.height/3)
        subviews[1].place(at: CGPoint(x: bounds.minX + bounds.width/3*2, y: bounds.minY), proposal: secondViewProposal)
        
        let thirdViewProposal = ProposedViewSize(width: bounds.width/3, height: bounds.height/3)
        subviews[2].place(at: CGPoint(x: bounds.minX + bounds.width/3*2, y: bounds.minY + bounds.height/3), proposal: thirdViewProposal)
        
        let lastViewProposal = ProposedViewSize(width: bounds.width, height: bounds.height/3)
        subviews[3].place(at: CGPoint(x: bounds.minX, y: bounds.minY + bounds.height/3*2), proposal: lastViewProposal)
    }
    
}
