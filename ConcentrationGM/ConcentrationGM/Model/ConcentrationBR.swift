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
    
    
    var indexOfOneAndOnlyCardFaceUp : Int?
    
    func choosecard(by index:Int){
        if !cards[index].isMatched {
            if let indexOfMatchingCard = indexOfOneAndOnlyCardFaceUp , indexOfMatchingCard != index {
                if cards[index].identifier == cards[indexOfMatchingCard].identifier {
                    cards[index].isMatched = true
                    cards[indexOfMatchingCard].isMatched = true
                    }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyCardFaceUp = nil
            } else {
                for faceDown in cards.indices {
                    cards[faceDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
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
    
    init(numberOfPairsOfCardes : Int) {
        for _ in 0..<numberOfPairsOfCardes {
            let card = Card()
            cards += [card,card]
            cards = shuffle(card: cards)
        
            
            }
        }
    
    
}
