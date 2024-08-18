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
    @State var offset: CGSize = .zero
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center) {
                Text(card.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(card.version)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .foregroundColor(.gray)
                
                HStack(alignment: .center, spacing: 16.0) {
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Price:")
                            .font(.caption)
                            
                        Text(card.norlamPrice)
                            .font(.title2)
                    }
                    .padding(8)
                    .foregroundColor(.white)
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.blue)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Foil:")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(card.foilPrice)
                    }
                    Spacer()
                }.padding(.top, 8)
                
                
                AsyncImage(url: card.imageBig,
                           content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 320, maxHeight: 700)
                        .rotation3DEffect(offset2Angle(true), axis: (x: -1, y: 0, z: 0))
                        .rotation3DEffect(offset2Angle(), axis: (x: 0, y: 1, z: 0))
                        .rotation3DEffect(offset2Angle(true) * 0.1, axis: (x: 0, y: 0, z: 1))
                },
                           placeholder: {
                }).padding(.top, 16)
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                offset = value.translation
                            }).onEnded({ _ in
                                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.32, blendDuration: 0.32)){
                                    offset = .zero
                                }
                            })
                    )
                
            }
        }
    }
    
    // MARK: Converting Offset Into X,Y Angles
    func offset2Angle(_ isVertical: Bool = false)->Angle{
        let progress = (isVertical ? offset.height : offset.width) / (isVertical ? screenSize.height : screenSize.width)
        return .init(degrees: progress * 10)
    }
    
    // MARK: Device Screen Size
    var screenSize: CGSize = {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }
        
        return window.screen.bounds.size
    }()
}

#Preview {
    CardDetailView(card: ModelCreator.makeCardModel())
}
