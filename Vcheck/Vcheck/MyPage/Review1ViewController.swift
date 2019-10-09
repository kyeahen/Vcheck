//
//  Review1ViewController.swift
//  Vcheck
//
//  Created by 장용범 on 09/10/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class Review1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goReview(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let navi = storyboard?.instantiateViewController(identifier: "createReviewNavi") as! UINavigationController
            navi.modalPresentationStyle = .fullScreen
            present(navi, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
        }
    }
 
}
