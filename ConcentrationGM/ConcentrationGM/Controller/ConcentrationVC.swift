//
//  ViewController.swift
//  ConcentrationGM
//
//  Created by Ghoul Mehdi on 21/08/2018.
//  Copyright © 2018 Ghoul Mehdi. All rights reserved.
//

import UIKit

class ConcentrationVC: UIViewController {
    
    lazy var game = ConcentrationBR(numberOfPairsOfCardes: (groupOfCards.count + 1) / 2)
    
    
    
    
    @IBOutlet private  weak var flipsCounterLBL: UILabel!
    @IBOutlet private var groupOfCards: [Button]!
    
    private var flipCounter = 0 {
        didSet {
            flipsCounterLBL.text = "Flips = \(flipCounter) "
        }
    }
    
    @IBAction private func newgame(_ sender: UIButton) {
        game.cards = game.Newgame()
        flipCounter = 0
        updateViewfromModel()
    }
    @IBAction private func cardTouched(_ sender: Button) {
        flipCounter = updateFlipCounter(index: groupOfCards.index(of: sender)!, counter: flipCounter)
        if let cardNumber = groupOfCards.index(of: sender) {
            game.choosecard(by: cardNumber)
            updateViewfromModel()
            renewGame()
        }
        
    }
   private func updateViewfromModel() {
        for index in groupOfCards.indices {
            let card = game.cards[index]
            let button = groupOfCards[index]
            if  card.isFaceUp {
                button.setTitle( setemoji(for: card), for: UIControlState.normal)
                button.backgroundColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                button.setTitle("", for: UIControlState.normal)
                
            }
        }
        
    }
    
   private var emojies = ["🧟‍♀️","🧛‍♂️","😈","👻","👹","👿","💀","🧟‍♂️","🧙🏼‍"]
   private var emojieForCard = [Int:String]()
    private func setemoji(for card: Card) -> String {
        if emojieForCard[card.identifier] == nil, emojies.count > 0 {
            emojieForCard[card.identifier] = emojies.remove(at: emojies.count.arc4Random)
        }
        return emojieForCard[card.identifier] ?? "?"
    }
    private func renewGame() {
        var k = 0
        for i in game.cards.indices {
            if  game.cards[i].isMatched {
                k += 1
            }
            if k ==  (groupOfCards.count){
                game.cards = game.Newgame()
                flipCounter = 0
                updateViewfromModel()
            }
        }
    }
    private func updateFlipCounter(index:Int, counter: Int) -> Int {
        var k = counter
        if !game.cards[index].isFaceUp && !game.cards[index].isMatched {
            k += 1
        }
        return k
    }

}
  
