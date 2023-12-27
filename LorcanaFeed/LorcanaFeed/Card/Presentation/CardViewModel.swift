//
//  CardViewModel.swift
//  LorcanaFeed
//
//  Created by marlon von ansale on 15/12/2023.
//

import Foundation

public struct CardViewModel: Identifiable {
    public let id: Int
    public let imageSmall: String
    public let imageBig: String
    public let name: String
    public let version: String
    public let collectorNumber: String
    public let rarity: String
    
    public init(id: Int, imageSmall: String, imageBig: String, name: String, chapter: String, version: String, collectorNumber: String, rarity: String) {
        self.id = id
        self.name = name
        self.imageSmall = imageSmall
        self.imageBig = imageBig
        self.version = version
        self.collectorNumber = collectorNumber
        self.rarity = rarity
    }
}
