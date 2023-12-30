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
        VStack(alignment: .leading, content: {
            HStack(alignment: .center, content: {
                Text("Price:")
                    .fontWeight(.bold)
                Text(cardPrice.price)
                Spacer()
            })
            HStack(alignment: .center, content: {
                Text("Condition:")
                    .fontWeight(.bold)
                Text(cardPrice.condition)
            })
            
            HStack(alignment: .center, content: {
                Text("Language:")
                    .fontWeight(.bold)
                Text(cardPrice.language)
            })
        }).padding()
    }
}

#Preview {
    CardPriceCell(cardPrice: ModelCreator.makeCardPriceModel())
}
