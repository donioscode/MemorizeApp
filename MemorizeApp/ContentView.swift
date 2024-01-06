//
//  ContentView.swift
//  MemorizeApp
//
//  Created by doniyor normuxammedov on 31/12/23.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻","☠️","😈","🤡","💀","👹","👺","😷","🤖","👽","🧚‍♀️","🧟"]
    
   @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView{
                cards
            }
            Spacer()
            cardsCountAdjusters
          }
        
         .padding()
    }
    
    var cardsCountAdjusters: some View {
        
    HStack {
       cardRemover
        Spacer()
        cardAdder
    }
    .imageScale(.large)
    .font(.largeTitle)
      
    }
    
    func cardCountAdjuster(by offset: Int,symbol: String ) -> some View {
        Button(action: {
            if cardCount < emojis.count {
                cardCount += offset
            }
        
          },label: {
            Image(systemName: symbol)
        })
        
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count )
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self ) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
         
        }
        .foregroundColor(.orange)
    }
    
    var cardAdder: some View {
       cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
    
    var  cardRemover: some View{
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
}


    

#Preview {
    ContentView()
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





