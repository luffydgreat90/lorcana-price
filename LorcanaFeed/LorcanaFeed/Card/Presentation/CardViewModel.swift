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
    public let imageBig: URL?
    public let rarity: String
    public let norlamPrice: String
    public let foilPrice: String
    
    public init(id: String, name: String, version: String, imageSmall: URL?, imageBig: URL?, rarity: String, norlamPrice: String, foilPrice: String) {
        self.id = id
        self.name = name
        self.version = version
        self.imageSmall = imageSmall
        self.imageBig = imageBig
        self.rarity = rarity
        self.norlamPrice = norlamPrice
        self.foilPrice = foilPrice
    }
}
