//
//  ModelCreater.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 17/12/2023.
//

import SwiftUI
import LorcanaFeed

enum ModelCreator {
    static func makeCardModel(id: String = "1") -> CardViewModel {
        CardViewModel(
            id: id,
            name: "Alan-a-dale",
            version: "Rockin' Rooster",
            imageSmall: URL(string: "https://cards.lorcast.io/card/digital/small/crd_d46b1371e56d486786fb471a1c043d3a.avif?1721850298"),
            imageNormal:  URL(string: "https://cards.lorcast.io/card/digital/normal/crd_d46b1371e56d486786fb471a1c043d3a.avif?1721850298"),
            imageBig: URL(string: "https://cards.lorcast.io/card/digital/large/crd_d46b1371e56d486786fb471a1c043d3a.avif?1721850298"),
            rarity: "common",
            norlamPrice: "$1.00",
            foilPrice: "$2.00",
            setName: "Shimmering Skies",
            ink: "Amber",
            collectorNumber: "12",
            cost: 4,
            flavorText: "knock three times",
            classifications: ["Character"]
        )
    }

    static func makeSetModel(id: String = "1") -> SetViewModel {
        SetViewModel(
            id: id,
            name: "Shimmering Skies",
            code: "5",
            released: "11 June 2025"
        )
    }

    static func makeCustomTabItemViewModel(image: String = "gear", order:Int) -> CustomTabItemViewModel {
        CustomTabItemViewModel(image: image, order: order)
    }
}
