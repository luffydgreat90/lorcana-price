//
//  HTTPURLResponse+StatusCode.swift
//  PokemonFeed
//
//  Created by Marlon Ansale.
//

import Foundation

public extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }

    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
