//
//  ImageSearchRequest.swift
//  PinterestApp
//
//  Created by 김가영 on 2023/02/19.
//

import Foundation

final class ImageSearchRequest: APIRequest {
    typealias Response = ImageSearchRequestResponse
    
    var url = "https://openapi.naver.com/v1/search/image"
    var headers: [String : String] = [
        "X-Naver-Client-Id": Config.N_CLIENT_ID,
        "X-Naver-Client-Secret": Config.N_CLIENT_SECRET
    ]
    var queries: [String : String] = [:]
    
    let size = 10
    
    init(query: String, page: Int = 0) {
        queries["display"] = size.stringValue
        queries["start"] = (page * size + 1).stringValue
        queries["query"] = query
    }
}

struct ImageSearchRequestResponse: Decodable {
    let items: [ImageSearchItem]
}

struct ImageSearchItem: Decodable {
    let title: String
    let link: String
    let thumbnail: String
    let sizeheight: String
    let sizewidth: String
}

extension Int {
    var stringValue: String {
        String(self)
    }
}
