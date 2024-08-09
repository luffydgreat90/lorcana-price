import SwiftUI
import LorcanaFeed

struct CardListCell: View {
    var card: CardViewModel

    var body: some View {
        HStack {
            AsyncImage(url: card.imageSmall)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
          
            VStack(alignment: .leading) {
                Text("Name: \(card.name)")
                Text("Rarity: \(card.rarity)")
            }
            Spacer()
        }.padding()
    }
}

struct CustomCell_Previews: PreviewProvider {
    static var previews: some View {
      
        CardListCell(card: ModelCreator.makeCardModel())
            .previewLayout(.sizeThatFits)
    }
}
