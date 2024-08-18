import SwiftUI
import LorcanaFeed

struct CardListCell: View {
    var card: CardViewModel
    var animation: Namespace.ID
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            HStack(spacing: -30) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(card.name)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text(card.version)
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("Rarity: \(card.rarity)")
                    Text("Price: \(card.normalPrice)")
                    Text("Foil: \(card.foilPrice)")
                }.frame(width: size.width / 2, alignment: .leading)
                .padding(20)
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.white)
                            .shadow(color: .black.opacity(0.08), radius: 8, x: 5, y: 5)
                            .shadow(color: .black.opacity(0.08), radius: 8, x: -5, y: -5)
                    }
                Spacer()
                
                AsyncImage(url: card.imageNormal,
                           content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                },
                           placeholder: {
                })
                .cornerRadius(8.0)
                .background(.gray)
                .frame(width: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: -5)
                .zIndex(1)
                .matchedGeometryEffect(id: card.id, in: animation)
                Spacer()
            }.padding(16)
             
        }.frame(height: 220)
    }
}

struct CustomCell_Previews: PreviewProvider {
    static var previews: some View {
        @Namespace var ns
        
        return CardListCell(card: ModelCreator.makeCardModel(), animation: ns)
            .previewLayout(.sizeThatFits)
    }
}

