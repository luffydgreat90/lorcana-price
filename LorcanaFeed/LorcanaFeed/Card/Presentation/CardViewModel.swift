//
//  CardViewModel.swift
//  LorcanaFeed
//
//  Created by marlon von ansale on 15/12/2023.
//

import Foundation

public struct CardViewModel: Identifiable {
    public var id: String
    public let image: String
    public let name: String
    public let chapter: String
    public let price: String
    
    public init(id: String, image: String, name: String, chapter: String, price: String) {
        self.id = id
        self.name = name
        self.chapter = chapter
        self.price = price
        self.image = image
    }
}
