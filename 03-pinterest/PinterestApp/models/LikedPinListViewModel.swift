//
//  LikedPinListViewModel.swift
//  PinterestApp
//
//  Created by 김가영 on 2023/02/20.
//

import Foundation
import Combine

final class LikedPinListViewModel: ObservableObject {
    @Published private(set) var likedPinList: [PinItem]
    var likedPinItemChangedPublisher: PassthroughSubject<UUID, Never>
    
    init(likedPinList: [PinItem] = []) {
        self.likedPinList = likedPinList
        likedPinItemChangedPublisher = PassthroughSubject()
    }
    
    func addPinItem(_ item: PinItem) {
        var likedItem = item
        likedItem.liked = true
        likedPinList.append(likedItem)
        likedPinItemChangedPublisher.send(item.id)
    }
    
    func removePinItem(_ item: PinItem) {
        likedPinList.removeAll { $0.id == item.id }
        likedPinItemChangedPublisher.send(item.id)
    }
}

extension LikedPinListViewModel {
    var likedPinIds: Set<UUID> {
        Set(likedPinList.map { $0.id })
    }
}
