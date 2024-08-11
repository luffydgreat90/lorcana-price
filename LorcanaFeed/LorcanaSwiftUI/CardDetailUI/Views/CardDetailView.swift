//
//  CardDetailView.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 17/12/2023.
//

import SwiftUI
import LorcanaFeed

struct CardDetailView: View {
    let card: CardViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Text("Card Name: \(card.name)")
                    .bold()
                    .multilineTextAlignment(.leading)
                    .dynamicTypeSize(.xxxLarge)
                    
                Text("Chapter: \(card.name)")
                    .bold()
                    .dynamicTypeSize(.xxLarge)
                
                HStack(alignment: .center, content: {
                    AsyncImage(url: card.imageSmall)
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Name: " + card.name)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.accentColor)
                      
                        Text("Rarity: " + card.rarity)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .padding(.trailing, 8)
                    }
                    
                    Spacer()
                })

            }
        }
    }
}

#Preview {
    CardDetailView(card: ModelCreator.makeCardModel())
}
