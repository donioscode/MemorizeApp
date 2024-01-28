//
//  ContentView.swift
//  MemorizeApp
//
//  Created by doniyor normuxammedov on 31/12/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewmodel: EmojiMemoryGame = EmojiMemoryGame()

    private let aspectRatio: CGFloat = 2/3
    var body: some View {
        VStack {
                cards
                    .animation(.default, value: viewmodel.cards)
            
            Button("Shuffle") {
                viewmodel.shuffle()
            }
            .background(.white)
        }
        .padding()
    }

   private var cards: some View {
        GeometryReader { geometry in
            let gridItemSize = gridItemWithThatFits(
                count:viewmodel.cards.count,
                size: geometry.size,
                atAspectRatio: aspectRatio
            )
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize),spacing: 0)],spacing: 0) {
                ForEach(viewmodel.cards) { card in
                    CardView(card)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewmodel.choose(card)
                    }
                }
            }
        }
        
        .foregroundColor(.orange)
    }
    
    func gridItemWithThatFits (
        count: Int,
        size: CGSize,
        atAspectRatio aspectRatio: CGFloat
    ) -> CGFloat {
        let count = CGFloat(count)
        var columnCount = 1.0
        repeat {
            let width = size.width / columnCount
            let height = width / aspectRatio
            
            let rowCount = (count / columnCount).rounded(.up)
            if rowCount * height < size.height {
                return (size.width / columnCount).rounded(.down)
            }
            columnCount += 1
        }while columnCount < count
        return min(size.width / count, size.height * aspectRatio).rounded(.down)
    }

}


struct CardView : View {
    let card : MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
            .opacity(card.isFaceUp ? 0 : 1)
    
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}



struct EmojiMemoryGameView_Previews: PreviewProvider{
    static var previews: some View{
        EmojiMemoryGameView()
    }
}

//changed Previews my hand

//
//#Preview {
//    EmojiMemoryGameView()
//}

