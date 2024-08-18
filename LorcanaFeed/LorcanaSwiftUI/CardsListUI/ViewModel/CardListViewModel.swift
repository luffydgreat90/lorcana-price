//
//  CardListViewModel.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 18/08/2024.
//

import Combine
import LorcanaFeed
import SwiftUI

public class CardListViewModel: ObservableObject {
    private(set) var cards: [CardViewModel] = []
    var card: CardViewModel? = nil

    public init(cards: [CardViewModel]) {
        self.cards = cards
    }
}
