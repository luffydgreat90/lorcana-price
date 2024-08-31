//
//  LoreCounterViewModel.swift
//  LorcanaPrice
//
//  Created by marlon von ansale on 24/08/2024.
//

import Combine
import Foundation

struct PlayerCounterModel: Identifiable {
    let id: String = UUID().uuidString
    var isFlip: Bool
    var lore: Int = 0
    var index: Int

    init(isFlip: Bool = false, lore: Int = 0, index:Int) {
        self.isFlip = isFlip
        self.lore = lore
        self.index = index
    }
}

final class LoreCounterViewModel: ObservableObject {
    @Published var lores: [PlayerCounterModel] = []
    @Published var playerTurnText = "Your Turn"
    private var isYourTurn:Bool = false
    
    init(playerLores: [PlayerCounterModel]) {
        self.lores = playerLores
    }

    func addLore(index: Int) {
        if lores[index].lore < 20 {
            lores[index].lore += 1
        }
    }

    func subtractLore(index: Int) {
        if lores[index].lore > 0 {
            lores[index].lore -= 1
        }
    }

    func clearLore() {
        lores = lores.map { player in  PlayerCounterModel(isFlip: player.isFlip, index: player.index) }
    }

    func changePlayer() {
        isYourTurn = !isYourTurn
        playerTurnText = isYourTurn ? "Your Turn" : "Opponents Turn"
    }
}
