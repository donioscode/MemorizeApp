//
//  MemorizeGame.swift
//  MemorizeApp
//
//  Created by doniyor normuxammedov on 07/01/24.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable {
    private (set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        //add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2,numberOfPairsOfCards){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))

        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCards: Int? {
        get {
            var faceUpCardIndicaes = [Int]()
            for index in cards.indices {
                    if cards[index].isFaceUp {
                        faceUpCardIndicaes.append(index)
                    }
                }
            if faceUpCardIndicaes.count == 1 {
                return faceUpCardIndicaes.first
            } else {
                return nil
                
            }
        }
        
        
        set {
            for index in cards.indices{
                if index == newValue {
                    cards[index].isFaceUp = true
                }else{
                    cards[index].isFaceUp = false
                }
            }
        }
    }
        
    
    
    mutating func choose (_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potaintialMatchIndex = indexOfTheOneAndOnlyFaceUpCards{
                    if cards[chosenIndex].content == cards[potaintialMatchIndex].content{
                        cards[chosenIndex].isMatched = true
                        cards[potaintialMatchIndex].isMatched = true
                    }
                }else{
                     indexOfTheOneAndOnlyFaceUpCards = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
                
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable,Identifiable,CustomStringConvertible {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        var id: String
        var description: String {
            "\(id):\(content):\(isFaceUp ? "up" : "down")\(isMatched ? "matched" : "")"
        }
    }
}
