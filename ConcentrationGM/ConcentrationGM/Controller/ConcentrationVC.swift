//
//  ViewController.swift
//  ConcentrationGM
//
//  Created by Ghoul Mehdi on 21/08/2018.
//  Copyright © 2018 Ghoul Mehdi. All rights reserved.
//

import UIKit

class ConcentrationVC: UIViewController {
    private lazy var game = ConcentrationBR(numberOfPairsOfCardes: (groupOfCards.count + 1) / 2)
    @IBOutlet weak var gameScore: UILabel!
    @IBOutlet private  weak var flipsCounterLBL: UILabel!
    @IBOutlet private var groupOfCards: [Button]!
    @IBAction private func newgame(_ sender: UIButton) {
        game.cards = game.Newgame()
        updateViewfromModel()
    }
    @IBAction private func cardTouched(_ sender: Button) {
        print(game.numberOfMatchedCards)
        if let cardNumber = groupOfCards.index(of: sender) {
            game.choosecard(by: cardNumber)
            updateViewfromModel()
            restGame()
        }
    }
    
   private func updateTheLabel() {
        gameScore.text = "Game Score = \(game.scoorNumbre)"
        flipsCounterLBL.text = "Flips = \(game.flipsnumbre) "
        
    }
    private func updateViewfromModel() {
        for index in groupOfCards.indices {
            let card = game.cards[index]
            let button = groupOfCards[index]
            if  card.isFaceUp {
                button.setTitle( setemoji(for: card), for: UIControl.State.normal)
                button.backgroundColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                button.setTitle("", for: UIControl.State.normal)
            }
        }
        updateTheLabel()
        
    }
    
    
    private var emojies = ["🧟‍♀️","🧛‍♂️","😈","👻","👹","👿","💀","🧟‍♂️","🧙🏼‍"]
    private var emojieForCard = [Int:String]()
    private func setemoji(for card: Card) -> String {
        if emojieForCard[card.identifier] == nil, emojies.count > 0 {
            emojieForCard[card.identifier] = emojies.remove(at: emojies.count.arc4Random)
        }
        return emojieForCard[card.identifier] ?? "?"
    }
    private func restGame() {
            if game.numberOfMatchedCards ==  (groupOfCards.count){
                game.cards = game.Newgame()
                updateViewfromModel()
                print(game.numberOfMatchedCards)
            }
        }
    }







