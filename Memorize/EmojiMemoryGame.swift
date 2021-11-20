//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Hiroyuki Miura on 2021/11/19.
//

import SwiftUI

func makeCardContent(index: Int) -> String {
  return "🌞"
}



class EmojiMemoryGame {
  
  static let emojis = ["🚗", "🚘", "🚙", "🚐", "🚌", "🚚", "🚛", "🚑", "🚒", "🏎", "🚓"]
  
  static func createMemoryGame() -> MemoryGame<String> {
    MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in EmojiMemoryGame.emojis[pairIndex] }
  }

  private(set) var model: MemoryGame<String> = createMemoryGame()

  var cards: Array<MemoryGame<String>.Card> {
    return model.cards
  }

}
