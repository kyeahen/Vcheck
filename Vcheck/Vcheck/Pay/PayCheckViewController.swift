//
//  PayCheckViewController.swift
//  Vcheck
//
//  Created by 장용범 on 09/10/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class PayCheckViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var gifImage: UIImageView!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    var count = 0{
        didSet{
            countLabel.text = "\(count)"
        }
    }
    
    let active : UIImage = #imageLiteral(resourceName: "payment_check_box_activated")
    let inactive: UIImage = #imageLiteral(resourceName: "payment_check_box_inactivated")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        navigationItem.backBarButtonItem?.title = ""
        setBackBtn()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.gifImage.isHidden = true
        
        b1.setImage(inactive, for: .normal)
        b2.setImage(inactive, for: .normal)
        b3.setImage(inactive, for: .normal)
        b4.setImage(inactive, for: .normal)
        
    }
    @IBAction func pay(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "PayReceiptViewController") as! PayReceiptViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    @IBAction func check(_ sender: UIButton) {
        if let image = sender.currentImage{
            if image == inactive{
                sender.setImage(UIImage(named: "payment_check_box_activated"), for: .normal)
                count += 1
            }else{
                sender.setImage(UIImage(named: "payment_check_box_inactivated"), for: .normal)
                count -= 1
            }
        }else{
            
        }
    }
    
}
