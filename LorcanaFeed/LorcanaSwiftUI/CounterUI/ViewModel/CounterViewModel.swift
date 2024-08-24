//
//  CounterViewModel.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 24/08/2024.
//

import SwiftUI

enum ViewBackground {
    case positive, negative, neutral

    var backgroundColor: Color {
        switch self {
        case .positive:
                .green
        case .negative:
                .red
        case .neutral:
                .blue
        }
    }
}

final class CounterViewModel: ObservableObject {
    @Published private(set) var tap: ViewBackground = .neutral
    @Published private(set) var lore: Int = 0

    func addLore() {
        tap = .positive

        if lore < 20 {
            lore += 1
        }
    }

    func subtractLore() {
        tap = .negative

        if lore > 0 {
            lore -= 1
        }
    }

    func finishAnimation() {
        tap = .neutral
    }
}
