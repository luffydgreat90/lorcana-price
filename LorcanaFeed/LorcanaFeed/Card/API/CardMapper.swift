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
        let usd: String
        let usd_foil: String
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
                imageBig: card.image_uris.digital.large,
                rarity: card.rarity,
                norlamPrice: card.prices.usd,
                foilPrice: card.prices.usd_foil)
        }
    }
}
