//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Danilo S Nascimento on 10/07/20.
//  Copyright © 2020 DanSantucci. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻","🎃","🕷"]
        
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
        
    
//     MARK: Access to Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    
//     MARK: INTENTS
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
    
}
