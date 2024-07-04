//
//  SetMapper.swift
//  LorcanaFeed
//
//  Created by marlon von ansale on 04/07/2024.
//

import Foundation

public enum SetMapper {
    private struct RemoteCard: Decodable {
        let id: Int
        let name: String
        let code: String
        let released_at: String
        let prereleased_at: Int
    }
}
