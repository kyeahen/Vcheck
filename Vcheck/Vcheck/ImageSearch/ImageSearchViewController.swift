//
//  ImageSearchViewController.swift
//  Vcheck
//
//  Created by 김예은 on 15/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class ImageSearchViewController: UIViewController, CAAnimationDelegate {
    
    @IBOutlet weak var lodingView: UIView!
    @IBOutlet weak var prevImageView: UIImageView!
    @IBOutlet weak var opImageView: UIImageView!
    @IBOutlet weak var gifImageView: UIImageView!
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    
    @IBOutlet weak var rateImageView: UIImageView!
    @IBOutlet weak var reviewButton: UIButton!
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var bookmarkImageView: UIImageView!
    var flag: Int = 0
    
    var products: Product?
    var productImage: UIImage?
    
    let gif = UIImage.gif(name: "o")

    override func viewDidLoad() {
        super.viewDidLoad()

        setData()
        setGif()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.lodingView.isHidden = true
            self.opImageView.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.gifImageView.image = UIImage(named: "o1")
    }
    
    func setGif() {
        gifImageView.image = gif
        gifImageView.animationDuration = gif!.duration
        gifImageView.animationRepeatCount = 1
        gifImageView.startAnimating()
        
        var values = [CGImage]()
        for image in gif!.images! {
            values.append(image.cgImage!)
        }

        let animation = CAKeyframeAnimation(keyPath: "contents")
        animation.calculationMode = CAAnimationCalculationMode.discrete
        animation.duration = gif!.duration
        animation.values = values
        // Set the repeat count
        animation.repeatCount = 1
        // Other stuff
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        // Set the delegate
        animation.delegate = self
        gifImageView.layer.add(animation, forKey: "animation")
    }
    
    func setData() {
        
        brandLabel.text = products?.brand_name
        prevImageView.image = productImage
        
        if products?.food_name == "블루문 벨지움 화이트" {
            nameLabel.text =
            """
            블루문
            벨지움화이트
            """
            productImageView.image = UIImage(named: "imgsearch_product_three_img")
            rateImageView.image = UIImage(named: "imgsearch_product_five_evaluation")
            detailImageView.image = UIImage(named: "imgsearch_product_three_ingredient")
            reviewButton.titleLabel?.text = "2개의 후기 보기"
            
        } else if products?.food_name == "수미칩 오리지널" {
            nameLabel.text =
            """
            수미칩
            오리지널
            """
            productImageView.image = UIImage(named: "imgsearch_product_one_img")
            rateImageView.image = UIImage(named: "imgsearch_product_one_evaluation")
            detailImageView.image = UIImage(named: "imgsearch_product_one_ingredient")
            reviewButton.titleLabel?.text = "23개의 후기 보기"
            
        } else if products?.food_name == "버드와이저" {
            nameLabel.text = products?.food_name
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
