//
//  ContentView.swift
//  01-kakaopay-main
//
//  Created by 김가영 on 2023/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            BlockGrid()
            Spacer()
        }
        .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model.startData)
    }
}
