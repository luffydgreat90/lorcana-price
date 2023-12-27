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
                    Image(systemName: card.imageSmall)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .padding()
                    
                    VStack(alignment: .leading) {
                      Text("Rarity: ")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.accentColor)
                      
                      Text("Number:")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .padding(.trailing, 8)
                        
                        Text("Price:")
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
    CardDetailView(card: ModelCreater.makeCardModel())
}
