//
//  Card.swift
//  ConcentrationGM
//
//  Created by Ghoul Mehdi on 21/08/2018.
//  Copyright © 2018 Ghoul Mehdi. All rights reserved.
//

import Foundation
struct Card {
    var isTheCardfliped = false
    var isFaceUp = false
     var isMatched = false
    var identifier: Int
    static var cardIdentifier = 0
    static func  generatUniqueIdenifier()-> Int {
        cardIdentifier += 1
        return cardIdentifier
        
    }
    init() {
        self.identifier = Card.generatUniqueIdenifier()
    }
}
