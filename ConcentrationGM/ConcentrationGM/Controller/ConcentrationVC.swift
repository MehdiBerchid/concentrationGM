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
  
    
    

    @IBOutlet weak var flipsCounterLBL: UILabel!
    @IBOutlet var groupOfCards: [Button]!
    var flipCounter = 0 {
        didSet {
            flipsCounterLBL.text = "Flips = \(flipCounter) "
        }
    }
    
    @IBAction func cardTouched(_ sender: Button) {
        flipCounter += 1
        if let cardNumber = groupOfCards.index(of: sender) {
            game.choosecard(by: cardNumber)
            updateViewfromModel()
        }
     }
    func updateViewfromModel() {
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
   
    
    
    
    
    var emojies = ["🧟‍♀️","🧛‍♂️","😈","👻","👹","👿","💀","🧟‍♂️","🧙🏼‍"]
    
    var emojieForCard = [Int:String]()
    
    func setemoji(for card: Card) -> String {
        if emojieForCard[card.identifier] == nil, emojies.count > 0 {
            let randomindec = Int(arc4random_uniform(UInt32(emojies.count)))
            emojieForCard[card.identifier] = emojies.remove(at: randomindec)
        }
       return emojieForCard[card.identifier] ?? "?"
        
    }
    
    
    
    
    
    
    
    
    
    
    
}
