//
//  ImageSearchDetailViewController.swift
//  Vcheck
//
//  Created by 김예은 on 15/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class ImageSearchDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var foodName: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        setData()
    }
    
    func setData() {
        titleLabel.text = foodName
        
        if foodName == "블루문 벨지움 화이트" {

            imageView.image = UIImage(named: "imgsearch_detailed_product_three_ingredient")
        
            
        } else if foodName == "수미칩 오리지널" {

            imageView.image = UIImage(named: "imgsearch_detailed_product_one_ingredient")
          
            
        } else if foodName == "버드와이저" {

            imageView.image = UIImage(named: "imgsearch_detailed_product_two_ingredient")
     
        } else {
            
        }
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
