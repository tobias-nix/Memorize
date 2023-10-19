//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by Tobias Nix on 19.10.23.
//

import SwiftUI

class EmojiMemorizeGame {
    
    static let emojis = ["🍎","🥑","🥦","🥒","🍇","🍕","🥐","🌶️"]
    
    var model: MemorizeGame<String> = MemorizeGame(numberOfPairsOfCards: 4) { emojis[$0] }
}
