import SwiftUI
import LorcanaFeed

struct CardListCell: View {
    var card: CardViewModel

    var body: some View {
        GeometryReader { main in
            let size = main.size
            HStack(spacing: -30) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Name: \(card.name)")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Rarity: \(card.rarity)")
                    Text("Price: \(card.norlamPrice)")
                    Text("Price (foil): \(card.foilPrice)")
                }.frame(width: size.width / 2, alignment: .leading)
                .padding(20)
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.white)
                            .shadow(color: .black.opacity(0.08), radius: 8, x: 5, y: 5)
                            .shadow(color: .black.opacity(0.08), radius: 8, x: -5, y: -5)
                    }.zIndex(1)
                Spacer()
                
                AsyncImage(url: card.imageSmall)
                    .frame(width: 130, height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: -5)
                
                Spacer()
            }.padding(20)
            
        }
    }
}

struct CustomCell_Previews: PreviewProvider {
    static var previews: some View {
      
        CardListCell(card: ModelCreator.makeCardModel())
            .previewLayout(.sizeThatFits)
    }
}
