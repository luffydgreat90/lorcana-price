//
//  LoreCounterViewModel.swift
//  LorcanaPrice
//
//  Created by marlon von ansale on 24/08/2024.
//

import Combine

final class LoreCounterViewModel: ObservableObject {
    @Published var lore1: Int = 0
    @Published var lore2: Int = 0
    @Published var playerTurnText = "Your Turn"
    private var isYourTurn:Bool = false

    func addLore1() {
        if lore1 < 20 {
            lore1 += 1
        }
    }

    func subtractLore1() {
        if lore1 > 0 {
            lore1 -= 1
        }
    }

    func addLore2() {
        if lore2 < 20 {
            lore2 += 1
        }
    }

    func subtractLore2() {
        if lore2 > 0 {
            lore2 -= 1
        }
    }

    func clearLore() {
        lore1 = 0
        lore2 = 0
    }

    func changePlayer() {
        isYourTurn = !isYourTurn

        playerTurnText = isYourTurn ? "Your Turn" : "Opponents Turn"
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
