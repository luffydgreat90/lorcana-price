//
//  CardDetailView.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 17/12/2023.
//

import SwiftUI
import LorcanaFeed

struct CardDetailView: View {
    var card: CardViewModel
    
    var body: some View {
        Text("Card Name: \(card.name)")
    }
}

#Preview {
    CardDetailView(card: ModelCreater.makeCardModel())
}
