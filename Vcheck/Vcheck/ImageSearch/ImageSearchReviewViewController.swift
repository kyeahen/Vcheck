//
//  ImageSearchReviewViewController.swift
//  Vcheck
//
//  Created by 김예은 on 15/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class ImageSearchReviewViewController: UIViewController {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    @IBOutlet weak var rateImageViwe: UIImageView!
    @IBOutlet weak var reviewImageView: UIImageView!
    
    var foodName: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        
    }
    
    func setData() {
        titleLabel.text = foodName
        
        if foodName == "블루문 벨지움 화이트" {
            reviewLabel.text = "2개"
            productImageView.image = UIImage(named: "imgsearch_product_three_small_img")
            rateImageViwe.image = UIImage(named: "imgsearch_detailed_product_three_evaluation")
            reviewImageView.image = UIImage(named: "imgsearch_detailed_product_three_review")
        
            
        } else if foodName == "수미칩 오리지널" {
            reviewLabel.text = "23개"
            productImageView.image = UIImage(named: "imgsearch_product_one_small_img")
            rateImageViwe.image = UIImage(named: "imgsearch_detailed_product_one_evaluation")
            reviewImageView.image = UIImage(named: "imgsearch_detailed_product_one_review")
          
            
        } else if foodName == "버드와이저" {
            reviewLabel.text = "103개"
            productImageView.image = UIImage(named: "imgsearch_product_two_img")
            rateImageViwe.image = UIImage(named: "imgsearch_detailed_product_two_evaluation")
            reviewImageView.image = UIImage(named: "imgsearch_detailed_product_two_review")
     
            
        } else {
            
        }
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
