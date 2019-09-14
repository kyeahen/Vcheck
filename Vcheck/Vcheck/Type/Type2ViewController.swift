//
//  Type2ViewController.swift
//  Vcheck
//
//  Created by 김예은 on 14/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class Type2ViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    
    var selectedType: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.isEnabled = false
    }
    
    func setCusomView() {
        
        imageView1.circleImageView()
        imageView2.circleImageView()
        imageView3.circleImageView()
    }
    
    @IBAction func normalTypeAction(_ sender: UITapGestureRecognizer) {
        
        selectedType = 1
        nextButton.isEnabled = true
        nextButton.setImage(UIImage(named: "category_next_activated_btn.png"), for: .normal)
    }
    
    @IBAction func customTypeAction(_ sender: UITapGestureRecognizer) {
        
        selectedType = 2
        nextButton.isEnabled = true
        nextButton.setImage(UIImage(named: "category_next_activated_btn.png"), for: .normal)
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        
        if selectedType == 1 {
            let normalVC = UIStoryboard(name: "Type", bundle: nil).instantiateViewController(withIdentifier: "Type3ViewController") as! Type3ViewController
            
            self.present(normalVC, animated: true, completion: nil)
            
        } else if selectedType == 2 {
            
            let customVC = UIStoryboard(name: "Type", bundle: nil).instantiateViewController(withIdentifier: "Type4ViewController") as! Type4ViewController
            
            self.present(customVC, animated: true, completion: nil)
            
        } else {
           nextButton.isEnabled = false
        }
    }
    
    @IBAction func prevAction(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindToType1", sender: self)
    }
    
    

}
