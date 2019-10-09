//
//  Type2ViewController.swift
//  Vcheck
//
//  Created by 김예은 on 14/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class Type2ViewController: UIViewController {
    
    @IBOutlet weak var veganButton: UIButton!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    
    var selectedType: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.isUserInteractionEnabled = false
        
        setCusomView()
    }
    
    func setCusomView() {
        
        imageView1.circleImageView()
        imageView2.circleImageView()
        imageView3.circleImageView()
        
        setNavigationBar()
        self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func choiceAction(_ sender: UIButton) {
        if sender == veganButton {
            veganButton.setImage(UIImage(named: "category_step_two_card_type"), for: .normal)
            myButton.setImage(UIImage(named: "category_step_two_card_mytype_inactivated"), for: .normal)
            veganButton.tag = 1
            myButton.tag = 0
            nextButton.isUserInteractionEnabled = true
            nextButton.setImage(UIImage(named: "category_next_activated_btn"), for: .normal)

        } else {
            veganButton.setImage(UIImage(named: "category_step_two_card_type_inactivated"), for: .normal)
            myButton.setImage(UIImage(named: "category_step_two_card_mytype"), for: .normal)

            veganButton.tag = 0
            myButton.tag = 1
            nextButton.isUserInteractionEnabled = true
            nextButton.setImage(UIImage(named: "category_next_activated_btn"), for: .normal)

        }
    }
    
    
    
    @IBAction func nextAction(_ sender: UIButton) {
        
        if veganButton.tag == 1 {
            let normalVC = UIStoryboard(name: "Type", bundle: nil).instantiateViewController(withIdentifier: "Type3ViewController") as! Type3ViewController
            normalVC.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(normalVC, animated: true)
            
        } else if myButton.tag == 1 {
            let customVC = UIStoryboard(name: "Type", bundle: nil).instantiateViewController(withIdentifier: "Type4ViewController") as! Type4ViewController
            
            customVC.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(customVC, animated: true)
            
        } else {
            nextButton.isUserInteractionEnabled = false
        }
    }
    
    @IBAction func prevAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    

}
