//
//  CardListView.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 16/12/2023.
//

import SwiftUI
import LorcanaFeed

public struct CardListView: View {
    @StateObject var viewModel: CardListViewModel
    @State private var showDetailView: Bool = false
    @Namespace var animation

    public var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .center, spacing: 0) {
                ForEach(viewModel.cards) { card in
                    CardListCell(card: card, animation: animation).onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)){
                            self.viewModel.card = card
                        }
                        withAnimation(
                            .interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                                self.showDetailView = true
                            }
                    }
                }
            }
        }
        .overlay {
            if let card = viewModel.card, showDetailView {
                CardDetailView(card: card, animation: animation, show: $showDetailView).transition(
                    .asymmetric(insertion: .identity, removal: .offset(y: 5))
                )
            }
        }
        .onChange(of: showDetailView) { newValue in
            if !newValue {
                withAnimation(.easeInOut(duration: 0.1).delay(0.2)) {
                    
                }
            }
        }
        
    }
}

#Preview {
    let cardListViewModel = CardListViewModel(cards: [ModelCreator.makeCardModel(id: "1"),
                                                      ModelCreator.makeCardModel(id: "2"),
                                                      ModelCreator.makeCardModel(id: "3")])

    return CardListView(viewModel: cardListViewModel)
}
