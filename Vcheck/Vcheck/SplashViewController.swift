//
//  SplashViewController.swift
//  Vcheck
//
//  Created by 장용범 on 09/10/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class SplashViewController: UIViewController {

    @IBOutlet weak var splashImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        splashImageView.loadGif(name: "splash")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            if #available(iOS 13.0, *) {
                let tabVC = UIStoryboard(name: "Type", bundle: nil).instantiateViewController(identifier: "typeNavi") as! UINavigationController
                tabVC.modalPresentationStyle = .fullScreen
                self.present(tabVC, animated: false, completion: nil)
            } else {
            }
            
        }
    }
  
}
