//
//  KakaoPayApp.swift
//  01-kakaopay-main
//
//  Created by 김가영 on 2023/01/23.
//

import SwiftUI

@main
struct KakaoPayApp: App {
    
    @StateObject private var model: Model = .startData
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
