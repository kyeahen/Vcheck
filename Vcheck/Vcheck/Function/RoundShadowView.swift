//
//  RoundShadowView.swift
//  Vcheck
//
//  Created by 김예은 on 14/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class RoundShadowView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // corner radius
        self.layer.cornerRadius = 10
        
        // border
        self.layer.borderWidth = 0.5
        self.layer.borderColor = #colorLiteral(red: 0.8861967325, green: 0.8863244653, blue: 0.8861687779, alpha: 1)
        
        // shadow
        self.layer.shadowColor = #colorLiteral(red: 0.8861967325, green: 0.8863244653, blue: 0.8861687779, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 4.0
    }
}

