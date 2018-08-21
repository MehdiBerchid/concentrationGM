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
        }
    }
    

}

