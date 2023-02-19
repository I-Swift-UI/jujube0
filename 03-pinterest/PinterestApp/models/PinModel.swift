//
//  PinModel.swift
//  PinterestApp
//
//  Created by 김가영 on 2023/02/04.
//

import Foundation
import Combine

struct PinModel: Identifiable {
    let id: UUID
    let widthHeightRatio: CGFloat
    let image: String
    
    init(widthHeightRatio: CGFloat = 1.0, image: String = "") {
        self.id = UUID()
        self.widthHeightRatio = widthHeightRatio
        self.image = image
    }
}

class PinListViewModel: ObservableObject {
    @Published
    var pinList: [PinModel]
    var page = 0
    
    init() {
        self.pinList = []
    }
    
    func getSampleData() -> AnyPublisher<[PinModel], Never> {
        return Just(PinModel.sampleListData)
            .delay(for: .seconds(1), scheduler: RunLoop.main)
            .eraseToAnyPublisher()
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

extension PinModel {
    static var sampleListData: [Self] {
        [PinModel(widthHeightRatio: 2.0),
         PinModel(widthHeightRatio: 1),
         PinModel(widthHeightRatio: 0.5),
         PinModel(widthHeightRatio: 1.5),
         PinModel(widthHeightRatio: 1.0),
         PinModel(widthHeightRatio: 1),
         PinModel(widthHeightRatio: 1),
         PinModel(widthHeightRatio: 1),
         PinModel(widthHeightRatio: 0.7),
         PinModel(widthHeightRatio: 1.2),
         PinModel(widthHeightRatio: 1.5),
         PinModel(widthHeightRatio: 0.3),
         PinModel(widthHeightRatio: 1.2)]
    }
}
