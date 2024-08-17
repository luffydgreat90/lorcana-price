//
//  CardViewModel.swift
//  LorcanaFeed
//
//  Created by marlon von ansale on 15/12/2023.
//

import Foundation

public struct CardViewModel: Identifiable {
    public let id: String
    public let name: String
    public let version: String
    public let imageSmall: URL?
    public let imageNormal: URL?
    public let imageBig: URL?
    public let rarity: String
    public let norlamPrice: String
    public let foilPrice: String
    public let setName: String
    public let ink: String
    public let collectorNumber: String
    public let cost: Int
    public let flavorText: String
    public let classifications: [String]
    
    public init(
        id: String,
        name: String,
        version: String,
        imageSmall: URL?,
        imageNormal: URL?,
        imageBig: URL?,
        rarity: String,
        norlamPrice: String,
        foilPrice: String,
        setName: String,
        ink: String,
        collectorNumber: String,
        cost: Int,
        flavorText: String,
        classifications: [String]
    ) {
        self.id = id
        self.name = name
        self.version = version
        self.imageSmall = imageSmall
        self.imageNormal = imageNormal
        self.imageBig = imageBig
        self.rarity = rarity
        self.norlamPrice = norlamPrice
        self.foilPrice = foilPrice
        self.setName = setName
        self.ink = ink
        self.collectorNumber = collectorNumber
        self.cost = cost
        self.flavorText = flavorText
        self.classifications = classifications
    }
}
