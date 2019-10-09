//
//  Type1ViewController.swift
//  Vcheck
//
//  Created by 김예은 on 14/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class Type1ViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setCustomView()
        
        nextButton.isUserInteractionEnabled = false
        nameTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        self.view.endEditing(true)
    }
    
    func setCustomView() {
        nextButton.makeRounded(cornerRadius: 20)
        imageView1.circleImageView()
        imageView2.circleImageView()
        imageView3.circleImageView()
        
        setNavigationBar()
        
        nameTextField.addTarget(self, action: #selector(emptyNameCheck), for: .editingChanged)
    }
    
    @objc func emptyNameCheck() {
        
        if nameTextField.text == ""{
            nextButton.isUserInteractionEnabled = false
            nextButton.setImage(UIImage(named: "category_next_inactivated_btn.png"), for: .normal)
        } else {
            nextButton.isUserInteractionEnabled = true
            nextButton.setImage(UIImage(named: "category_next_activated_btn.png"), for: .normal)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToType2" {
            UserDefaults.standard.set(nameTextField.text ?? "", forKey: "name")
        }
    }
    

}
