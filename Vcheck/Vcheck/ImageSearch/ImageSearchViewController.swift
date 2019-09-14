//
//  ImageSearchViewController.swift
//  Vcheck
//
//  Created by 김예은 on 15/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class ImageSearchViewController: UIViewController {
    
    @IBOutlet weak var bookmarkImageView: UIImageView!
    var flag: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func reviewAction(_ sender: UITapGestureRecognizer) {
        
        let reviewVC = UIStoryboard(name: "ImageSearch", bundle: nil).instantiateViewController(withIdentifier: "ImageSearchReviewViewController") as! ImageSearchReviewViewController
        
        self.present(reviewVC, animated: true, completion: nil)
    }
    
    @IBAction func detailAction(_ sender: Any) {
        
        let detailVC = UIStoryboard(name: "ImageSearch", bundle: nil).instantiateViewController(withIdentifier: "ImageSearchDetailViewController") as! ImageSearchDetailViewController
        
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
