//
//  Config.swift
//  PinterestApp
//
//  Created by 김가영 on 2023/02/19.
//

import Foundation

struct Config {
    static var N_CLIENT_ID     = getValue(key: "N_CLIENT_ID")
    static var N_CLIENT_SECRET  = getValue(key: "N_CLIENT_SECRET")
    
    private static func getValue(key: String) -> String {
        Bundle.main.infoDictionary?[key] as? String ?? ""
    }
}
