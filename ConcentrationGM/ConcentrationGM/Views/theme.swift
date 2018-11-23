//
//  theme.swift
//  ConcentrationGM
//
//  Created by Ghoul Mehdi on 11/23/18.
//  Copyright © 2018 Ghoul Mehdi. All rights reserved.
//

import UIKit
enum Theme : Int, CaseIterable  {
    
    case Animals , Halloween, Sports, Countries, Faces, Fruits
    
    var emojies : [String] {
        switch self {
        case .Animals:
            return ["🦊", "🐼", "🦁", "🐘", "🐓", "🦀", "🐷", "🦉"]
        case .Halloween:
            return ["🧟‍♀️","🧛‍♂️","😈","👻","👹","👿","💀","🧟‍♂️","🧙🏼‍"]
        case .Sports :
            return ["🏌️", "🤼‍♂️", "🥋", "🏹", "🥊", "🏊", "🤾🏿‍♂️", "🏇🏿"]
        case .Countries:
            return ["🇧🇷", "🇧🇪", "🇯🇵", "🇨🇦", "🇺🇸", "🇵🇪", "🇮🇪", "🇦🇷"]
        case .Faces :
            return ["😀", "🙄", "😡", "🤢", "🤡", "😱", "😍", "🤠"]
            
        case .Fruits :
            return ["🥑", "🍍", "🍆", "🍠", "🍉", "🍇", "🥝", "🍒"]
        }
    }
    var backGroundColor: UIColor {
        switch self {
        case .Animals:
            return #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        case .Countries :
            return #colorLiteral(red: 0.6679978967, green: 0.4751212597, blue: 0.2586010993, alpha: 1)
        case .Faces :
            return #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        case .Fruits:
            return #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        case .Halloween:
            return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        case .Sports:
            return #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
            
        }
    }
    var cardColor : UIColor {
        switch self {
        case .Animals:
            return #colorLiteral(red: 0.2400059521, green: 0.1806528544, blue: 0.4862745106, alpha: 1)
        case .Countries :
            return #colorLiteral(red: 0.2792143688, green: 0.466992575, blue: 0.6679978967, alpha: 1)
        case .Faces :
            return #colorLiteral(red: 0.7081241211, green: 0.9686274529, blue: 0.4436533784, alpha: 1)
        case .Fruits:
            return #colorLiteral(red: 0.04573633708, green: 0.8078431487, blue: 0.4392427255, alpha: 1)
        case .Halloween:
            return #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        case .Sports:
            return #colorLiteral(red: 0.5647059083, green: 0.3665911691, blue: 0.2851433657, alpha: 1)
        }
    }
    static var themeCount = Theme.allCases.count
    
    
    
    
}
