//
//  ContentView.swift
//  MemorizeApp
//
//  Created by doniyor normuxammedov on 31/12/23.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻","☠️","😈","🤡","💀"]
    var body: some View {
        HStack{
            ForEach(emojis.indices,id: \.self ) { index in
                CardView(content: emojis[index])
            }
            
        }
        .foregroundColor(.orange)
        .padding()
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
                if isFaceUp{
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                      Text(content).font(.largeTitle)
                } else{
                    base.fill()
            }
    
            }
            .onTapGesture {
                isFaceUp = !isFaceUp
        }
    }
}





