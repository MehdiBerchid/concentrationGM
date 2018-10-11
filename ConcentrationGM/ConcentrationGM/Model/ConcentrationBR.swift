//
//  ConcentrationBR.swift
//  ConcentrationGM
//
//  Created by Ghoul Mehdi on 21/08/2018.
//  Copyright © 2018 Ghoul Mehdi. All rights reserved.
//

import Foundation
class ConcentrationBR {
    var cards = [Card]()
    var indexOfOneAndOnlyCardFaceUp : Int? {
        get {
            var foundIndex : Int?
            for index in cards.indices {
                if cards[index].isFaceUp  {
                    if foundIndex == nil {
                        foundIndex = index
                    
                } else {
                    return nil
                }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (newValue == index )
            }
        }
    }
    func choosecard(by index:Int) {
        if !cards[index].isMatched {
            if let indexOfMatchingCard = indexOfOneAndOnlyCardFaceUp , indexOfMatchingCard != index {
                if cards[index].identifier == cards[indexOfMatchingCard].identifier {
                    cards[index].isMatched = true
                    cards[indexOfMatchingCard].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyCardFaceUp = index
            }
        }
    }
    func shuffle(card : [Card]) -> [Card]{
        var cards = card
        var shuffledCard = [Card]()
        for _ in 0..<cards.count {
            let randomNumbre = Int(arc4random_uniform(UInt32(cards.count)))
            shuffledCard.append(cards.remove(at: randomNumbre))
        }; return shuffledCard
    }
    func Newgame() -> [Card] {
        var newCards = shuffle(card:cards)
        for i in newCards.indices {
            newCards[i].isFaceUp = false
            newCards[i].isMatched = false
        }
        return newCards
    }
    init(numberOfPairsOfCardes : Int) {
        for _ in 0..<numberOfPairsOfCardes {
            let card = Card()
            cards += [card,card]
            cards = shuffle(card: cards)
        }
    }
}
