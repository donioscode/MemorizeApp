//
//  ContentView.swift
//  MemorizeApp
//
//  Created by doniyor normuxammedov on 31/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.blue)
        .padding()
    }
}

#Preview {
    ContentView()
}

struct CardView : View {
    @State var isFaceUp = false
    
    var body: some View{
        ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                if isFaceUp{
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text("👻").font(.largeTitle)
                } else{
                    base.fill()
            }
    
            }
            .onTapGesture {
                isFaceUp = !isFaceUp
        }
    }
}





