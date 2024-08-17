//
//  CardMapper.swift
//  LorcanaFeed
//
//  Created by marlon von ansale on 27/12/2023.
//

import Foundation

public enum CardMapper {
    private struct RemoteCard: Decodable {
        let id: String
        let name: String
        let version: String
        let image_uris: ImageURI
        let rarity: String
        let prices: Prices
        let set: Set
        let ink: String
        let collector_number: String
        let cost: Int
        let flavor_text: String
        let classifications: [String]
    }
    
    private struct ImageURI: Decodable {
        let digital: Digital
    }
    
    private struct Digital: Decodable {
        let small: URL
        let normal: URL
        let large: URL
    }
    
    private struct Prices: Decodable {
        let usd: Decimal
        let usd_foil: Decimal
    }
    
    private struct Set: Decodable {
        let name: String
    }

    private enum Error: Swift.Error {
        case invalidData
    }

    public static func map(_ data: Data, from response: HTTPURLResponse, chapter: String) throws -> [CardViewModel] {
        let decoder = JSONDecoder()
        
        guard response.isOK, let root = try? decoder.decode([RemoteCard].self, from: data) else {
            throw Error.invalidData
        }
        
        return root.map { card in
            CardViewModel(
                id: card.id,
                name: card.name,
                version: card.version,
                imageSmall: card.image_uris.digital.small, 
                imageNormal: card.image_uris.digital.normal,
                imageBig: card.image_uris.digital.large,
                rarity: card.rarity,
                norlamPrice: card.prices.usd.formatted(),
                foilPrice: card.prices.usd_foil.formatted(),
                setName: card.set.name,
                ink: card.ink,
                collectorNumber: card.collector_number,
                cost: card.cost,
                flavorText: card.flavor_text,
                classifications: card.classifications
            )
        }
    }
}
