//
//  CardListView.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 16/12/2023.
//

import SwiftUI
import LorcanaFeed

struct CardListView: View {
    var cards: [CardViewModel] = []
    @State var card: CardViewModel? = nil
    @State private var showDetailView: Bool = false
    @Namespace private var animation
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .center, spacing: 0) {
                    ForEach(cards) { card in
                        CardListCell(card: card, animation: animation).onTapGesture {
                            withAnimation(.easeInOut(duration: 0.2)){
                                
                            }
                            withAnimation(
                                .interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                                    self.card = card
                                self.showDetailView = true
                            }
                        }
                    }
                }
            }
            .overlay {
                if let card, showDetailView {
                    CardDetailView(card: card, animation: animation, show: $showDetailView).transition(
                        .asymmetric(insertion: .identity, removal: .offset(y: 5))
                    )
                }
            }.onChange(of: showDetailView) { newValue in
                if !newValue {
                    withAnimation(.easeInOut(duration: 0.05).delay(0.2)) {
                       
                    }
                }
            }
        }
    }
}

#Preview {
    CardListView(cards: [ModelCreator.makeCardModel(id: "1"),
                         ModelCreator.makeCardModel(id: "2"),
                         ModelCreator.makeCardModel(id: "3")])
}
