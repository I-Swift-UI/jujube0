//
//  ContentView.swift
//  PinterestApp
//
//  Created by 김가영 on 2023/02/03.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var pinListViewModel = PinListViewModel()
    
    var body: some View {
        TabView {
            PinterestView(pinListViewModel: pinListViewModel)
                .tabItem {
                    Image(systemName: "doc.text.image")
                }
            PinterestView(pinListViewModel: pinListViewModel)
                .tabItem {
                    Image(systemName: "heart.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
