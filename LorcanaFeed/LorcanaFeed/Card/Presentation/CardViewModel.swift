//
//  CardViewModel.swift
//  LorcanaFeed
//
//  Created by marlon von ansale on 15/12/2023.
//

import Foundation

public struct CardViewModel: Identifiable {
    public var id: Int
    public let imageSmall: String
    public let imageBig: String
    public let name: String
    public let chapter: String
    public let price: String
    public let version: String
    
    public init(id: Int, imageSmall: String, imageBig: String, name: String, chapter: String, price: String, version: String) {
        self.id = id
        self.name = name
        self.chapter = chapter
        self.price = price
        self.imageSmall = imageSmall
        self.imageBig = imageBig
        self.version = version
    }
}
