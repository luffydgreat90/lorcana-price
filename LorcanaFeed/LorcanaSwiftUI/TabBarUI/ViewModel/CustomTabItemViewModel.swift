//
//  CustomTabItemViewModel.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 01/09/2024.
//

import SwiftUI

public struct CustomTabItemViewModel: Identifiable, Equatable {
    public let id: String = UUID().uuidString
    public let title: String
    public let image: String
    public let order: Int
    public init(title: String, image: String, order: Int) {
        self.title = title
        self.image = image
        self.order = order
    }
}
