//
//  LikedPinListViewModel.swift
//  PinterestApp
//
//  Created by 김가영 on 2023/02/20.
//

import Foundation
import Combine

final class LikedPinListViewModel: ObservableObject {
    public let objectWillChange = PassthroughSubject<UUID, Never>()
    
    @Published private(set) var likedPinList: [PinItem]
    
    init(likedPinList: [PinItem] = []) {
        self.likedPinList = likedPinList
    }
    
    func addPinItem(_ item: PinItem) {
        var likedItem = item
        likedItem.liked = true
        likedPinList.append(likedItem)
        objectWillChange.send(item.id)
    }
    
    func removePinItem(_ item: PinItem) {
        likedPinList.removeAll { $0.id == item.id }
        objectWillChange.send(item.id)
    }
}

extension LikedPinListViewModel {
    var likedPinIds: Set<UUID> {
        Set(likedPinList.map { $0.id })
    }
}
