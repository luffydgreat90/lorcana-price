//
//  CardPriceViewModel.swift
//  LorcanaFeed
//
//  Created by marlon von ansale on 27/12/2023.
//

import Foundation

public struct CardPriceViewModel: Identifiable {
    public let id: Int
    public let name: String
    public let cents: Int
    public let price: String
    public let condition: String
    public let language: String
    public let isFoil: Bool
    
    public init(id: Int, name: String, cents: Int, price: String, condition: String, language: String, isFoil: Bool) {
        self.id = id
        self.name = name
        self.cents = cents
        self.price = price
        self.condition = condition
        self.language = language
        self.isFoil = isFoil
    }
}
