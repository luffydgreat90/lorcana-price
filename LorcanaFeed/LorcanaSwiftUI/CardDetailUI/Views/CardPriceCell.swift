//
//  CardPriceCell.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 27/12/2023.
//

import SwiftUI
import LorcanaFeed

struct CardPriceCell: View {
    let cardPrice: CardPriceViewModel
    
    var body: some View {
        HStack(alignment: .center, content: {
            Text("Price:")
            Text(cardPrice.price)
        })
    }
}

#Preview {
    CardPriceCell(cardPrice: ModelCreator.makeCardPriceModel())
}
