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
    var animation: Namespace.ID
    @State var offset: CGSize = .zero
    @Binding var show: Bool
    @State private var offsetAnimation: Bool = false
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center) {
                HStack {
                    Spacer()
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            offsetAnimation = false
                        }
                        withAnimation(.easeInOut(duration: 0.35).delay(0.1)) {
                            show = false
                        }
                    } label: {
                        Image(systemName: "x.circle.fill") 
                    }.foregroundColor(.black).padding(.trailing, 16.0)
    
                }
                
                VStack {
                    Text(card.name)
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text(card.version)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .foregroundColor(.gray)
                }.offset(y: offsetAnimation ? 0 : 100)
                    .opacity(offsetAnimation ? 1 : 0)
                
                AsyncImage(url: card.imageBig,
                           content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                },
                           placeholder: {
                })
                .frame(maxWidth: 320, maxHeight: 700)
                .rotation3DEffect(offset2Angle(true), axis: (x: -1, y: 0, z: 0))
                .rotation3DEffect(offset2Angle(), axis: (x: 0, y: 1, z: 0))
                .rotation3DEffect(offset2Angle(true) * 0.1, axis: (x: 0, y: 0, z: 1))
                .padding(.top, 16)
                    .matchedGeometryEffect(id: card.id, in: animation)
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
                
                HStack(alignment: .center, spacing: 16.0) {
                    Spacer()
                    PriceView(header: "Price:", value: card.normalPrice)
                    PriceView(header: "Foil:", value: card.foilPrice)
                    Spacer()
                    
                }
                .padding(.top, 8)
                .offset(y: offsetAnimation ? 0 : 100)
                .opacity(offsetAnimation ? 1 : 0)
            }
        }.background(.white)
         .onAppear {
             withAnimation(.easeInOut(duration: 0.35).delay(0.1)) {
                 offsetAnimation = true
             }
        }
    }
    
    // MARK: Converting Offset Into X,Y Angles
    private func offset2Angle(_ isVertical: Bool = false) -> Angle {
        let progress = (isVertical ? offset.height : offset.width) / (isVertical ? CGSize.screenSize.height : CGSize.screenSize.width)
        return .init(degrees: progress * 10)
    }
    
}

#Preview {
    struct Preview: View {
        @State var show = true
        @Namespace var ns
        
        var body: some View {
            CardDetailView(card: ModelCreator.makeCardModel(), animation: ns, show: $show)
        }
    }
    
    return Preview()
}
