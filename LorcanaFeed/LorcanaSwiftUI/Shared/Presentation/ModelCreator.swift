//
//  ModelCreater.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 17/12/2023.
//

import Foundation
import LorcanaFeed

enum ModelCreator {
    static func makeCardModel(id: Int = 1) -> CardViewModel {
        CardViewModel(id: id, imageSmall: "photo.artframe", imageBig: "photo.artframe", name: "Test", chapter: "First", version: "Alternate Art", collectorNumber: "1/100", rarity: "Rare")
    }
    
    static func makeCardPriceModel(id: Int = 1) -> CardPriceViewModel {
        CardPriceViewModel(id: id, expansion: "First Chapter", name: "Test", cents: 1234, price: "$12.34", condition: "Near Mint", language: "EN")
    }
}
