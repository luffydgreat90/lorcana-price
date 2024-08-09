//
//  SetViewModel.swift
//  LorcanaFeed
//
//  Created by marlon von ansale on 05/07/2024.
//

import Foundation

public struct SetViewModel {
    public let id: String
    public let name: String
    public let code: String
    public let released: String
    
    public init(id: String, name: String, code: String, released: String) {
        self.id = id
        self.name = name
        self.code = code
        self.released = released
    }
}
