//
//  ContentView.swift
//  MemorizeApp
//
//  Created by doniyor normuxammedov on 31/12/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    let emojis = ["👻","☠️","😈","🤡","💀","👹","👺","😷","🤖","👽","🧚‍♀️","🧟"]
    
   @State var cardCount: Int = 4
    
    var body: some View {
            ScrollView{
                cards
            }
            
          .padding()
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(emojis.indices, id: \.self ) { index in
                CardView(content: emojis[index])
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
    var content : String
    @State var isFaceUp = true
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
            
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
    
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}





