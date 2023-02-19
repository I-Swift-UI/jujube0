//
//  PinterestView.swift
//  PinterestApp
//
//  Created by 김가영 on 2023/02/07.
//

import SwiftUI

struct PinterestView: View {
    @ObservedObject var pinListViewModel: PinListViewModel
    
    private let columnSize = 2
    
    private var pinModelList: [[PinModel]] {
        var list: [[PinModel]] = .init(repeating: [], count: columnSize)
        pinListViewModel.pinList.enumerated().forEach { i, item in
            let listIndex = i % columnSize
            list[listIndex].append(item)
        }
        return list
    }
    
    @State var didReachEnd = true
    
    var body: some View {
        ScrollView {
            HStack(alignment: .top) {
                ForEach(0..<columnSize, id: \.self) { i in
                    PinterestLazyStackView(pinList: pinModelList[i],
                                           didReachEnd: $didReachEnd)
                }
            }
            .onChange(of: didReachEnd, perform: { value in
                guard didReachEnd else { return }
                pinListViewModel.request() {
                    didReachEnd = false
                }
            })
        }
        .padding(4)
        .onAppear {
            pinListViewModel.request() {
                didReachEnd = false
            }
        }
    }
}

struct PinterestView_Previews: PreviewProvider {
    static var previews: some View {
        PinterestView(pinListViewModel: .init())
            
    }
}
