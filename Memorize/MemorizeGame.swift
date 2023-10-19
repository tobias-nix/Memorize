//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Tobias Nix on 19.10.23.
//

import Foundation

struct MemorizeGame<CardContent> {
    var cards: [Card]
    
    init(numberOfPairsOfCards: Int, createContent: (Int) -> CardContent) {
        cards = []
        
        for i in 0..<numberOfPairsOfCards {
            cards.append(Card(content: createContent(i)))
            cards.append(Card(content: createContent(i)))
        }
        // TODO: create pairs of cards
    }
    
    func choose(_ card: Card) {
        // TODO: memorize logic
    }
    
    struct Card {
        var content: CardContent
        var isFaceUp = true
        var isMatched = false
    }
}

    struct MemoryGame01 {
        var cards: [Card]
        
        struct Card {
            var content: String
            var isFaceUp = true
            var isMatched = false
        }
    }
