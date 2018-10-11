//
//  extantions .swift
//  ConcentrationGM
//
//  Created by Ghoul Mehdi on 10/10/2018.
//  Copyright © 2018 Ghoul Mehdi. All rights reserved.
//

import Foundation

extension Int {
    var arc4Random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }; if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        else {
            return 0
        }
    }
}

