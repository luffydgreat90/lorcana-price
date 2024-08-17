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
            VStack(alignment: .leading) {
                HStack(alignment: .center, content: {
                    AsyncImage(url: card.imageNormal,
                               content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 180, maxHeight: 400)
                    },
                               placeholder: {
                        
                    })
                    VStack(alignment: .leading) {
                        Text(card.collectorNumber)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.top, 8)
                        
                        Text(card.name)
                            .font(.title2)
                            .fontWeight(.semibold)
                           
                        
                        Text(card.version)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .foregroundColor(.gray)
                        
                        Text(card.rarity)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .padding(.top, 4)
                        
                        Text(card.ink)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .padding(.top, 4)
                        
                        Text(card.setName)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .padding(.top, 4)
                        
                        Spacer()
                    }.padding(16)
                })
                
                HStack {
                    Spacer()
                    Text(card.norlamPrice)
               
                    Text(card.foilPrice)
                    Spacer()
                }.padding(.top, 8.0)
                
                HStack {
                    Text("Description:")
                        .font(.subheadline)
                    Text(card.flavorText)
                        .font(.subheadline)
                        .frame(width: .infinity)
                        .multilineTextAlignment(.leading)
                }.padding(.top, 8.0)
                
                HStack {
                    Text("Type:")
                        .font(.subheadline)
                    Text("Character")
                        .font(.subheadline)
                        .frame(width: .infinity)
                        .multilineTextAlignment(.leading)
                }.padding(.top, 8.0)
                
//                HStack {
//                    Text("Illustrator:")
//                        .font(.subheadline)
//                    Text(card.)
//                        .font(.subheadline)
//                        .frame(width: .infinity)
//                        .multilineTextAlignment(.leading)
//                }.padding(.top, 8.0)

            }.padding(8)
        }
    }
}

#Preview {
    CardDetailView(card: ModelCreator.makeCardModel())
}
