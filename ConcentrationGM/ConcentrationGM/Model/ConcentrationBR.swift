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
    private(set) var numberOfMatchedCards = 0

    private var indexOfOneAndOnlyCardFaceUp : Int? {
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
    private(set) var flipsnumbre = 0
    private(set) var scoorNumbre = 0
    
    private func flipCounting(by index: Int) {
        if !cards[index].isMatched && !cards[index].isFaceUp {
            flipsnumbre += 1
        }
    }
    private var listOfFlipedCard = [Int]()
    private func penaltyCounting(by index: Int){
        if  listOfFlipedCard.contains(cards[index].identifier) && !cards[index].isMatched || cards[index].isTheCardfliped && !cards[index].isMatched {
            scoorNumbre = scoorNumbre - 1
        } else {
            listOfFlipedCard.append(cards[index].identifier)
            cards[index].isTheCardfliped = true

        }
    }
    func choosecard(by index:Int) {
         flipCounting(by: index)
            if !cards[index].isMatched {
            if let indexOfMatchingCard = indexOfOneAndOnlyCardFaceUp , indexOfMatchingCard != index {
                if cards[index].identifier == cards[indexOfMatchingCard].identifier {
                    cards[index].isMatched = true
                    cards[indexOfMatchingCard].isMatched = true
                    scoorNumbre += 2
                    numberOfMatchedCards = numberOfMatchedCards + 2
                    
                    
                }
                penaltyCounting(by: index)
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyCardFaceUp = index
            }
        }
    }
   
    func Newgame() -> [Card] {
        var newCards = cards.shuffleList as! [Card]
        listOfFlipedCard = [Int]()
        flipsnumbre = 0
        scoorNumbre = 0
        for i in newCards.indices {
            newCards[i].isFaceUp = false
            newCards[i].isMatched = false
            newCards[i].isTheCardfliped = false
        }
        return newCards
    }
    
    
    init(numberOfPairsOfCardes : Int) {
        for _ in 0..<numberOfPairsOfCardes {
            let card = Card()
            cards += [card,card]
            cards =  cards.shuffleList as! [Card]
        }
    }
}
