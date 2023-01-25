
# 01 카카오페이 메인 화면

실제 화면 / 구현 화면

<img width=30% alt="image" src="https://user-images.githubusercontent.com/60654009/214059739-62536e92-de68-4adc-9960-4ad2a8bd85d6.png"><img width=30% alt="image" src="https://user-images.githubusercontent.com/60654009/214060192-decb711f-6c62-4030-95bc-3a52f18211ef.png">


Apple WWDC 2022 [Compose custom layouts with SwiftUI](https://developer.apple.com/videos/play/wwdc2022/10056/) 참고

Layout protocol을 만족하는 BlockGridLayout 생성

```swift
// BlockGridLayout
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
