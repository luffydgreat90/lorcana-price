//
//  LoreCounterViewModel.swift
//  LorcanaPrice
//
//  Created by marlon von ansale on 24/08/2024.
//

import Combine

final class LoreCounterViewModel: ObservableObject {
    @Published var lore1: LoreViewModel = LoreViewModel()
    @Published var lore2: LoreViewModel = LoreViewModel()

    func clearLore() {
        lore1.clearLore()
        lore2.clearLore()
    }
}

final class LoreViewModel: ObservableObject {
    @Published var lore: Int = 0

    func addLore() {
        if lore < 20 {
            lore += 1
        }
    }

    func subtractLore() {
        if lore > 0 {
            lore -= 1
        }
    }

    func clearLore() {
        lore = 0
    }
}
