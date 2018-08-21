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
    func choosecard(by index:Int){
        
    }
    
    
    init(numberOfPairsOfCardes : Int) {
        for _ in 0..<numberOfPairsOfCardes {
            let card = Card()
            cards += [card,card]
            }
        }
    
    
}
