//
//  MemoryGame.swift
//  Memorize
//
//  Created by Hiroyuki Miura on 2021/11/19.
//

import Foundation

struct MemoryGame<CardContent> {
  private(set) var cards: Array<Card>
  
  func choose(_ card: Card) {
    
  }
  
  init(numberOfPairsOfCards: Int, createCardContent:  (Int) -> CardContent) {
    cards = Array<Card>()
    // add numberOfPairsOfCards x 2 cards to cards array
    for pairIndex in 0..<numberOfPairsOfCards {
      let content: CardContent = createCardContent(pairIndex)
      cards.append(Card(isFaceUp: false, isMatched: false, Content: content))
      cards.append(Card(isFaceUp: false, isMatched: false, Content: content))

    }
  }
  
  struct Card {
    var isFaceUp: Bool
    var isMatched: Bool
    var Content: CardContent
  }
}
