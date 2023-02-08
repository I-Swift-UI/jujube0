//
//  PinterestView.swift
//  PinterestApp
//
//  Created by 김가영 on 2023/02/07.
//

import SwiftUI

struct PinterestView: View {
    @ObservedObject var pinListViewModel: PinListViewModel
    
    private var firstPinList: [PinModel] {
        pinListViewModel.pinList.enumerated()
            .filter { index, _ in index % 2 == 0 }
            .map { $1 }
    }
    private var secondPinList: [PinModel] {
        pinListViewModel.pinList.enumerated()
            .filter { index, _ in index % 2 != 0 }
            .map { $1 }
    }
    
    @State var didReachEnd = true
    
    var body: some View {
        ScrollView {
            HStack(alignment: .top) {
                PinterestLazyStackView(pinList: firstPinList, didReachEnd: $didReachEnd)
                PinterestLazyStackView(pinList: secondPinList, didReachEnd: $didReachEnd)
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
