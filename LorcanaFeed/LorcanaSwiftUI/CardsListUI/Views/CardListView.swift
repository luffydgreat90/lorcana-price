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
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                ForEach(cards) { card in
                    CardListCell(card: card)
                }
            }
        }
    }
}

#Preview {
    CardListView(cards: [ModelCreater.makeCardModel()])
}
