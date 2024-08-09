//
//  SetMapper.swift
//  LorcanaFeed
//
//  Created by marlon von ansale on 04/07/2024.
//

import Foundation

public enum SetMapper {
    private struct RemoteResult: Decodable {
        let results: [RemoteSet]
    }
    
    private struct RemoteSet: Decodable {
        let id: String
        let name: String
        let code: String
        let released_at: String
        let prereleased_at: Int
    }
    
    private enum Error: Swift.Error {
        case invalidData
    }
    
    public static func map(_ data: Data, from response: HTTPURLResponse, chapter: String) throws -> [SetViewModel] {
        let decoder = JSONDecoder()
        
        guard response.isOK, let root = try? decoder.decode(RemoteResult.self, from: data) else {
            throw Error.invalidData
        }
        
        return root.results.map { set in
            SetViewModel(
                id: set.id,
                name: set.name,
                code: set.code,
                released: set.released_at)
        }
    }
}
