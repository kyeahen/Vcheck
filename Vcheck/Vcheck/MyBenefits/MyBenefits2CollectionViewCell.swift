//
//  MyBenefits2CollectionViewCell.swift
//  Vcheck
//
//  Created by 김예은 on 14/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class MyBenefits2CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var couponButton: UIButton!
    
    var actionClosure : (() -> Void)? = nil

    @IBAction func couponAction(_ sender: UIButton) {
        
        self.actionClosure?()
    }
}
