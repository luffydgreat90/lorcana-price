//
//  LoreCounterViewModel.swift
//  LorcanaPrice
//
//  Created by marlon von ansale on 24/08/2024.
//

import Combine

final class LoreCounterViewModel: ObservableObject {
    @Published var lores: [Int] = []
    @Published var playerTurnText = "Your Turn"
    private var isYourTurn:Bool = false
    
    init(playerLores: [Int]) {
        self.lores = playerLores
    }

    func addLore(index: Int) {
        if lores[index] < 20 {
            lores[index] += 1
        }
    }

    func subtractLore(index: Int) {
        if lores[index] > 0 {
            lores[index] -= 1
        }
    }

    func clearLore() {
        lores = lores.map { _ in 0 }
    }

    func changePlayer() {
        isYourTurn = !isYourTurn
        playerTurnText = isYourTurn ? "Your Turn" : "Opponents Turn"
    }
}
