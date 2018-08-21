//
//  Button.swift
//  ConcentrationGM
//
//  Created by Ghoul Mehdi on 21/08/2018.
//  Copyright © 2018 Ghoul Mehdi. All rights reserved.
//

import UIKit
@IBDesignable
class Button: UIButton {
    override func layoutSubviews() {
        super .layoutSubviews()
        layer.cornerRadius = CGFloat(10)
    }

}
