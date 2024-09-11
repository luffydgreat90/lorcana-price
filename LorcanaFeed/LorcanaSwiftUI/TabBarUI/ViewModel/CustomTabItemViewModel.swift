//
//  CustomTabItemViewModel.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 01/09/2024.
//

import SwiftUI

public struct CustomTabItemViewModel: Identifiable, Equatable {
    public var id: String = UUID().uuidString
    public let image: String
    public let order: Int

    public init(image: String, order: Int) {
        self.image = image
        self.order = order
    }
}
