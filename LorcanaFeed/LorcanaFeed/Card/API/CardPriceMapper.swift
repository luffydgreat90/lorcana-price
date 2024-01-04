//
//  CardPriceMapper.swift
//  LorcanaFeed
//
//  Created by marlon von ansale on 28/12/2023.
//

import Foundation

public enum CardPriceMapper {
    private struct CardPrice: Decodable {
        let id: Int
        let blueprint_id: Int
        let name_en: String
        let price_cents: Int
        let price_currency: String
        let quantity: Int
        let properties_hash: PropertiesHash
        let price: Price
    }
    
    private struct PropertiesHash: Decodable {
        let condition: String
        let lorcana_rarity: String
        let collector_number: String
        let signed: Bool
        let lorcana_language: String
        let lorcana_foil: Bool
    }
    
    private struct Price: Decodable {
        let cents: Int
        let formatted: String
    }
    
    private enum Error: Swift.Error {
        case invalidData
    }
    
    public static func map(_ data: Data, from response: HTTPURLResponse, bluePrintID: String) throws -> [CardPriceViewModel] {
        let cardData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        guard let cardPrices = cardData?[bluePrintID] as? [String: Any] else {
            throw Error.invalidData
        }
        
        let prices = try JSONDecoder().decode([CardPrice].self, from: JSONSerialization.data(withJSONObject: cardPrices))
        
        return prices.map { cardPrice in
            CardPriceViewModel(id: cardPrice.id,
                               name: cardPrice.name_en,
                               cents: cardPrice.price_cents,
                               price: cardPrice.price.formatted,
                               condition: cardPrice.properties_hash.condition,
                               language: cardPrice.properties_hash.lorcana_language,
                               isFoil: cardPrice.properties_hash.lorcana_foil)
        }
    }
}
