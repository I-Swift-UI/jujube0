//
//  ContentView.swift
//  PinterestApp
//
//  Created by 김가영 on 2023/02/03.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var pinListViewModel = PinListViewModel()
    @StateObject private var likedPinListViewModel = LikedPinListViewModel()
    
    var body: some View {
        TabView {
            PinterestView(pinListViewModel: pinListViewModel,
                          likedPinListViewModel: likedPinListViewModel)
                .tabItem {
                    Image(systemName: "doc.text.image")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
