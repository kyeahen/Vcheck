//
//  ImageSearchViewController.swift
//  Vcheck
//
//  Created by 김예은 on 15/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class ImageSearchViewController: UIViewController {
    
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    
    @IBOutlet weak var rateImageView: UIImageView!
    @IBOutlet weak var reviewButton: UIButton!
    @IBOutlet weak var detailImageView: UIImageView!
    
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
        
        if products?.food_name == "블루문 벨지움 화이트" {
            productImageView.image = UIImage(named: "imgsearch_product_three_img")
            rateImageView.image = UIImage(named: "imgsearch_product_five_evaluation")
            detailImageView.image = UIImage(named: "imgsearch_detailed_product_three_ingredient")
            reviewButton.titleLabel?.text = "2개의 후기 보기"
            
        } else if products?.food_name == "수미칩 오리지널" {
            productImageView.image = UIImage(named: "imgsearch_product_one_img")
            rateImageView.image = UIImage(named: "imgsearch_product_one_evaluation")
            detailImageView.image = UIImage(named: "imgsearch_product_one_ingredient")
            reviewButton.titleLabel?.text = "23개의 후기 보기"
            
        } else if products?.food_name == "버드와이저" {
            productImageView.image = UIImage(named: "imgsearch_product_two_img")
            rateImageView.image = UIImage(named: "imgsearch_product_two_evaluation")
            detailImageView.image = UIImage(named: "imgsearch_product_two_ingredient")
            reviewButton.titleLabel?.text = "23개의 후기 보기"
            
        } else {
            
        }
    }
    
    @IBAction func reviewAction(_ sender: UIButton) {
        
        let reviewVC = UIStoryboard(name: "ImageSearch", bundle: nil).instantiateViewController(withIdentifier: "ImageSearchReviewViewController") as! ImageSearchReviewViewController
        
        reviewVC.foodName = products?.food_name
        reviewVC.modalPresentationStyle = .fullScreen
        self.present(reviewVC, animated: true, completion: nil)
    }
    
    @IBAction func detailAction(_ sender: Any) {
        
        let detailVC = UIStoryboard(name: "ImageSearch", bundle: nil).instantiateViewController(withIdentifier: "ImageSearchDetailViewController") as! ImageSearchDetailViewController
        detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true, completion: nil)
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
