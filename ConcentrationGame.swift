//
//  ConcentrationGame.swift
//  Concentration 1
//
//  Created by Артём on 18.12.2021.
//  Copyright © 2021 Артём Бабасюк. All rights reserved.
//

import Foundation

class ConcentrationGame {
    var cards = [Card]() // массив из карточек
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard  (at index: Int) { // алгоритм как должна играть игра. В эту функцию заходит индекс карточки и с ним происходит действие
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    init(numberOfPairsCards: Int) {
        for _ in 1...numberOfPairsCards {
            let card = Card()
            cards.append(card)
            cards.append(card)

            
        }
    }
}
