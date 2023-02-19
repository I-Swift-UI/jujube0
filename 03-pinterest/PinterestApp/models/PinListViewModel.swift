//
//  PinListViewModel.swift
//  PinterestApp
//
//  Created by 김가영 on 2023/02/20.
//

import Foundation
import Combine

class PinListViewModel: ObservableObject {
    @Published
    var pinList: [PinItem]
    var page = 0
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        self.pinList = []
    }
    
    func request(completion: (() -> Void)? = nil) {
        ImageSearchRequest(query: "카즈하", page: page)
            .request()
            .map {
                completion?()
                return self.pinList + $0.items.map { $0.toModel() }
            }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: &$pinList)

        print("current page = \(page)")
        page += 1
    }
}

