//
//  CardMapper.swift
//  LorcanaFeed
//
//  Created by marlon von ansale on 27/12/2023.
//

import Foundation

public enum CardMapper {
    private struct Root: Decodable {
        let data: [RemoteCard]
    }
    
    private struct RemoteCard: Decodable {
        let id: Int
        let name: String
        let version: String
        let number: String
        let expansion_id: Int
        let image: Image
        let fixed_properties: FixedProperties
    }
    
    private struct Image: Decodable {
        let show: ImageURL
        let preview: ImageURL
    }
    
    private struct ImageURL: Decodable {
        let url: String
    }
    
    private struct FixedProperties: Decodable {
        let collector_number: String
        let lorcana_rarity: String
    }
    
    private enum Error: Swift.Error {
        case invalidData
    }
    
    
    public static func map(_ data: Data, from response: HTTPURLResponse, chapter: String) throws -> [CardViewModel] {
        let decoder = JSONDecoder()
        
        guard response.isOK, let root = try? decoder.decode(Root.self, from: data) else {
            throw Error.invalidData
        }
        
        return root.data.map { remote in
            CardViewModel(
                id: remote.id,
                imageSmall: remote.image.preview.url,
                imageBig: remote.image.show.url, 
                name: remote.name,
                chapter: chapter,
                version: remote.version,
                collectorNumber: remote.fixed_properties.collector_number,
                rarity: remote.fixed_properties.lorcana_rarity
            )
        }
    }
}
