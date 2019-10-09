//
//  ImageSearchXViewController.swift
//  Vcheck
//
//  Created by 김예은 on 05/10/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class ImageSearchXViewController: UIViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var xDetailLabel: UILabel!
    @IBOutlet weak var xImageView: UIImageView!
    
    @IBOutlet weak var etcImageView: UIImageView!
    
    @IBOutlet weak var bookmarkImageView: UIImageView!
    var flag: Int = 0
    
    var products: Product?

    override func viewDidLoad() {
        super.viewDidLoad()

        setData()
    }
    
    func setData() {
        nameLabel.text = products?.food_name
        brandLabel.text = products?.brand_name
        
        if products?.food_name == "머드쉐이크 초콜릿" { //
            productImageView.image = UIImage(named: "imgsearch_product_six_img")
            xLabel.text = "피하는 성분 1개 포함"
            xDetailLabel.text = "우유 성분 포함"
            etcImageView.image = UIImage(named: "imgsearch_product_six_recommendation")
            
        } else if products?.food_name == "포카칩 어니언" { //
            productImageView.image = UIImage(named: "imgsearch_product_four_img")
            xLabel.text = "피하는 성분 1개 포함"
            xDetailLabel.text = "우유 성분 포함"
            etcImageView.image = UIImage(named: "imgsearch_product_four_recommendation")
            

        } else  { //포테토칩 샤워크림 어니언 //
            productImageView.image = UIImage(named: "imgsearch_product_five_img")
            xLabel.text = "피하는 성분 2개 포함"
            xDetailLabel.text = "닭고기, 쇠고기 성분 포함"
            etcImageView.image = UIImage(named: "imgsearch_product_five_recommendation")

        }
    }
    

    
    @IBAction func closeAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func bookmarkAction(_ sender: UITapGestureRecognizer) {
        
        if flag == 1 {
            bookmarkImageView.image = UIImage(named: "bookmark_inactivated_icon.png")
            flag = 0
        } else {
            bookmarkImageView.image = UIImage(named: "bookmark_activated_icon.png")
            flag = 1
        }
        
    }
    
    
    
}



