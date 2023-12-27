import SwiftUI
import LorcanaFeed

struct CardListCell: View {
    var card: CardViewModel

    var body: some View {
        HStack {
            Image(systemName: card.imageSmall)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100) // Adjust the size as needed
          
            VStack(alignment: .leading) {
                Text("Name: \(card.name)")
                Text("Chapter: \(card.chapter)")
                Text("Price: \(card.price)")
            }
            Spacer()
        }.padding()
    }
}

struct CustomCell_Previews: PreviewProvider {
    static var previews: some View {
      
        CardListCell(card: ModelCreater.makeCardModel())
    }
}
