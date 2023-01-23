//
//  ContentView.swift
//  01-kakaopay-main
//
//  Created by 김가영 on 2023/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                BlockGrid()
                    .frame(height: geometry.size.width * 1.2)
                Spacer()
            }
            .background(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model.startData)
    }
}
