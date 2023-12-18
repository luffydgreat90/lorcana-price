//
//  ModelCreater.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 17/12/2023.
//

import Foundation
import LorcanaFeed

enum ModelCreater {
    static func makeCardModel() -> CardViewModel {
        CardViewModel(id:"123",
                      image: "photo.artframe",
                      name: "test",
                      chapter: "test",
                      price: "$10.0")
    }
}
