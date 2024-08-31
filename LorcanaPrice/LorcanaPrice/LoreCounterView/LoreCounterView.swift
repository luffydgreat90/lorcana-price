//
//  LoreCounterView.swift
//  LorcanaPrice
//
//  Created by marlon von ansale on 19/08/2024.
//

import SwiftUI
import LorcanaSwiftUI

struct LoreCounterView: View {
    @StateObject var viewModel = LoreCounterViewModel(playerLores: [PlayerCounterModel(isFlip: true, index: 0),PlayerCounterModel(index: 1)])
    @State private var showAlert = false

    var body: some View {
        VStack {
            ForEach($viewModel.lores) { playerCounter in
                CounterView(isFlip: playerCounter.isFlip.wrappedValue,
                            lore: playerCounter.lore,
                            index: playerCounter.index.wrappedValue,
                            subtractHandler: viewModel.subtractLore(index:),
                            addHandler: viewModel.addLore(index:))
            }

            HStack {
                Button(action: {
                    showAlert = true
                },
                       label: {
                    Image(systemName: "arrow.clockwise")
                        .padding(16)
                })

                Spacer(minLength: 0)

                Text(viewModel.playerTurnText)
                    .font(.title2)
                    .fontWeight(.black)

                Spacer(minLength: 0)

                Button(action: {
                    withAnimation(.easeIn(duration: 0.2)) {
                        viewModel.changePlayer()
                    }
                },
                       label: {
                    Image(systemName: "play.fill")
                        .padding(16)
                })

            }.frame(maxWidth: .infinity)
                .background(.black)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .padding()
        .alert(isPresented: $showAlert, content: {
            Alert(
                title: Text("Are you sure you want to reset?"),
                primaryButton: .default(
                    Text("Yes")
                        .fontWeight(.bold),
                    action: {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            viewModel.clearLore()
                        }
                    }
                ),
                secondaryButton: .destructive(
                    Text("No")
                        .fontWeight(.bold)
                )
            )

        })
    }
}

#Preview {
    LoreCounterView()
}
