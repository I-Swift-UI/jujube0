
# 01 카카오페이 메인 화면

실제 화면 / 구현 화면

<img width=30% alt="image" src="https://user-images.githubusercontent.com/60654009/214059739-62536e92-de68-4adc-9960-4ad2a8bd85d6.png"><img width=30% alt="image" src="https://user-images.githubusercontent.com/60654009/214060192-decb711f-6c62-4030-95bc-3a52f18211ef.png">


Apple WWDC 2022 [Compose custom layouts with SwiftUI](https://developer.apple.com/videos/play/wwdc2022/10056/) 참고

Layout protocol을 만족하는 BlockGridLayout 생성

```swift
// BlockGridLayout
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
```

```swift
// BlockGrid.swift
var body: some View {
  BlockGridLayout {
    ForEach(...)
  }
}
```
