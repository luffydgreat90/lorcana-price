//
//  ModelCreater.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 17/12/2023.
//

import Foundation
import LorcanaFeed

enum ModelCreator {
    static func makeCardModel(id: String = "1") -> CardViewModel {
        CardViewModel(
            id: id,
            name: "test",
            version: "1",
            imageSmall: URL(string: "test"),
            imageBig: URL(string: "test"),
            rarity: "common",
            norlamPrice: "1.00", 
            foilPrice: "2.00"
        )
    }
}
