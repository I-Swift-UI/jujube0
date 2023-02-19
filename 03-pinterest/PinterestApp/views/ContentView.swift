//
//  ContentView.swift
//  PinterestApp
//
//  Created by 김가영 on 2023/02/03.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject private var likedPinListViewModel = LikedPinListViewModel()
    @StateObject private var pinListViewModel = PinListViewModel()
    
    var body: some View {
        TabView {
            PinterestView(pinListViewModel: pinListViewModel,
                          likedPinListViewModel: likedPinListViewModel)
                .tabItem {
                    Image(systemName: "doc.text.image")
                }
            PinLikedListView(likedPinListViewModel: likedPinListViewModel)
                .tabItem {
                    Image(systemName: "heart.circle")
                }
        }
        .onReceive(likedPinListViewModel.likedPinItemChangedPublisher, perform: { id in
            if let index = pinListViewModel.pinList.firstIndex(where: { $0.id == id }) {
                pinListViewModel.pinList[index].liked.toggle()
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
