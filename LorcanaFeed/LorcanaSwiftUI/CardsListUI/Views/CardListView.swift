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
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .center, spacing: 0) {
                ForEach(cards) { card in
                    CardListCell(card: card)
                }
            }
        }
            
    }
}

#Preview {
    CardListView(cards: [ModelCreator.makeCardModel(),
                         ModelCreator.makeCardModel()])
}
