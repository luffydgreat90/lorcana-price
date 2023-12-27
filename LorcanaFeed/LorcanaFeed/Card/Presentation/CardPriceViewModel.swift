//
//  CardPriceViewModel.swift
//  LorcanaFeed
//
//  Created by marlon von ansale on 27/12/2023.
//

import Foundation

public struct CardPriceViewModel: Identifiable {
    public let id: Int
    public let expansion : String
    public let name: String
    public let cents: Int
    public let price: String
    public let condition: String
    public let language: String
    
    public init(id: Int, expansion: String, name: String, cents: Int, price: String, condition: String, language: String) {
        self.id = id
        self.expansion = expansion
        self.name = name
        self.cents = cents
        self.price = price
        self.condition = condition
        self.language = language
    }
}
