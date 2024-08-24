//
//  LoreCounterView.swift
//  LorcanaPrice
//
//  Created by marlon von ansale on 19/08/2024.
//

import SwiftUI
import LorcanaSwiftUI

struct LoreCounterView: View {
    @StateObject var viewModel = LoreCounterViewModel()

    var body: some View {
        VStack {
            CounterView(isFlip:true, lore: $viewModel.lore1.lore) {
                viewModel.lore1.subtractLore()
            } addHandler: {
                viewModel.lore1.addLore()
            }

            

            CounterView(lore: $viewModel.lore2.lore) {
                viewModel.lore2.subtractLore()
            } addHandler: {
                viewModel.lore2.addLore()
            }

        }
        .padding()
    }
}

#Preview {
    LoreCounterView()
}
