//
//  ContentView.swift
//  MemorizeApp
//
//  Created by doniyor normuxammedov on 31/12/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewmodel: EmojiMemoryGame = EmojiMemoryGame()

    var body: some View {
            ScrollView{
                cards
            }
            
          .padding()
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(viewmodel.cards.indices, id: \.self ) { index in
                CardView(card: viewmodel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
         
        }
        .foregroundColor(.orange)
    }

}


#Preview {
    EmojiMemoryGameView()
}

struct CardView : View {
    let card : MemoryGame<String>.Card
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                Text(card.content).font(.largeTitle)
            
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
    
        }
    }
}





