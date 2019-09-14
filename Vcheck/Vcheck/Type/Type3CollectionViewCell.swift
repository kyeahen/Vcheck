//
//  Type3CollectionViewCell.swift
//  Vcheck
//
//  Created by 김예은 on 14/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class Type3CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        categoryView.makeRounded(cornerRadius: 20)
    }
}
