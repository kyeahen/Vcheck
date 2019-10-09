//
//  Type4ViewController.swift
//  Vcheck
//
//  Created by 김예은 on 14/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

//TODO: 나만의 유형 저장하기
class Type4ViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn10: UIButton!
    @IBOutlet weak var btn11: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setCustomView()
        setStartButton()
        
    }
    
    func setCustomView() {
        imageView1.circleImageView()
        imageView2.circleImageView()
        imageView3.circleImageView()
        
        setNavigationBar()
        self.navigationItem.hidesBackButton = true
    }
    
    func setStartButton() {
        if btn1.tag == 0 && btn2.tag == 0 && btn3.tag == 0 && btn4.tag == 0 && btn5.tag == 0 && btn6.tag == 0 && btn7.tag == 0 && btn8.tag == 0 && btn9.tag == 0 && btn10.tag == 0 && btn11.tag == 0 {
            
            nextButton.setImage(UIImage(named: "category_finish_inactivated_btn"), for: .normal)
            nextButton.isUserInteractionEnabled = false
            
        } else {
            
            nextButton.setImage(UIImage(named: "category_finish_activated_btn"), for: .normal)
            nextButton.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func choiceAction(_ sender: UIButton) {
        
        
        if sender == btn1 {
            
            btn1.isSelected = !btn1.isSelected
            
            print(sender.tag)
            if btn1.isSelected == true {
                btn1.setImage(UIImage(named: "category_fruit_activated_btn"), for: .normal)
                UserDefaults.standard.set(true, forKey: "fruit")
                btn1.tag = 1
                setStartButton()
                
            } else {
                btn1.setImage(UIImage(named: "category_fruit_inactivated_btn"), for: .normal)
                UserDefaults.standard.set(false, forKey: "fruit")
                btn1.tag = 0
                setStartButton()
            }
            
 
            
        } else if sender == btn2 {
            
            btn2.isSelected = !btn2.isSelected
            
            print(sender.tag)
            if btn2.isSelected == true {
                btn2.setImage(UIImage(named: "category_nut_activated_btn"), for: .normal)
                
                  UserDefaults.standard.set(true, forKey: "nut")
                btn2.tag = 1
                setStartButton()
                
            } else {
                btn2.setImage(UIImage(named: "category_nut_inactivated_btn"), for: .normal)
                UserDefaults.standard.set(false, forKey: "nut")
                btn2.tag = 0
                setStartButton()
            }

            
        } else if sender == btn3 {
            btn3.isSelected = !btn3.isSelected
            
            print(sender.tag)
            if btn3.isSelected == true {
                btn3.setImage(UIImage(named: "category_grain_activated_btn"), for: .normal)
                UserDefaults.standard.set(true, forKey: "grain")
                btn3.tag = 1
                setStartButton()
                
            } else {
                btn3.setImage(UIImage(named: "category_grain_inactivated_btn"), for: .normal)
                UserDefaults.standard.set(false, forKey: "grain")
                btn3.tag = 0
                setStartButton()
            }
            
        } else if sender == btn4 {
            btn4.isSelected = !btn4.isSelected
            
            print(sender.tag)
            if btn4.isSelected == true {
                btn4.setImage(UIImage(named: "category_vegetable_activated_btn"), for: .normal)
                UserDefaults.standard.set(true, forKey: "vegetable")
                btn4.tag = 1
                setStartButton()
                
            } else {
                btn4.setImage(UIImage(named: "category_vegetable_inactivated_btn"), for: .normal)
                UserDefaults.standard.set(false, forKey: "vegetable")
                btn4.tag = 0
                setStartButton()
            }
        } else if sender == btn5 {
            btn5.isSelected = !btn5.isSelected
            
            print(sender.tag)
            if btn5.isSelected == true {
                btn5.setImage(UIImage(named: "category_bean_activated_btn"), for: .normal)
                UserDefaults.standard.set(true, forKey: "bean")
                btn5.tag = 1
                setStartButton()
            } else {
                btn5.setImage(UIImage(named: "category_bean_inactivated_btn"), for: .normal)
                UserDefaults.standard.set(false, forKey: "bean")
                btn5.tag = 0
                setStartButton()
            }
        } else if sender == btn6 {
            btn6.isSelected = !btn6.isSelected
            
            print(sender.tag)
            if btn6.isSelected == true {
                btn6.setImage(UIImage(named: "category_honey_activated_btn"), for: .normal)
                UserDefaults.standard.set(true, forKey: "honey")
                btn6.tag = 1
                setStartButton()
                
            } else {
                btn6.setImage(UIImage(named: "category_honey_inactivated_btn"), for: .normal)
                UserDefaults.standard.set(false, forKey: "honey")
                btn6.tag = 0
                setStartButton()
            }
        } else if sender == btn7 {
            btn7.isSelected = !btn7.isSelected
            
            print(sender.tag)
            if btn7.isSelected == true {
                btn7.setImage(UIImage(named: "category_milk_activated_btn"), for: .normal)
                UserDefaults.standard.set(true, forKey: "milk")
                btn7.tag = 1
                setStartButton()
                
            } else {
                btn7.setImage(UIImage(named: "category_milk_inactivated_btn"), for: .normal)
                UserDefaults.standard.set(false, forKey: "milk")
                btn7.tag = 0
                setStartButton()
            }
        } else if sender == btn8 {
            btn8.isSelected = !btn8.isSelected
            
            print(sender.tag)
            if btn8.isSelected == true {
                btn8.setImage(UIImage(named: "category_egg_activated_btn"), for: .normal)
                UserDefaults.standard.set(true, forKey: "egg")
                btn8.tag = 1
                setStartButton()
                
            } else {
                btn8.setImage(UIImage(named: "category_egg_inactivated_btn"), for: .normal)
                UserDefaults.standard.set(false, forKey: "egg")
                btn8.tag = 0
                setStartButton()
            }
        } else if sender == btn9 {
            btn9.isSelected = !btn9.isSelected
            
            print(sender.tag)
            if btn9.isSelected == true {
                btn9.setImage(UIImage(named: "category_seafood_activated_btn"), for: .normal)
                UserDefaults.standard.set(true, forKey: "seafood")
                btn9.tag = 1
                setStartButton()
            } else {
                btn9.setImage(UIImage(named: "category_seafood_inactivated_btn"), for: .normal)
                UserDefaults.standard.set(false, forKey: "seafood")
                btn9.tag = 0
                setStartButton()
            }
        } else if sender == btn10 {
            btn10.isSelected = !btn10.isSelected
            
            print(sender.tag)
            if btn10.isSelected == true {
                btn10.setImage(UIImage(named: "category_chicken_activated_btn"), for: .normal)
                UserDefaults.standard.set(true, forKey: "chicken")
                btn10.tag = 1
                setStartButton()
                
            } else {
                btn10.setImage(UIImage(named: "category_chicken_inactivated_btn"), for: .normal)
                UserDefaults.standard.set(false, forKey: "chicken")
                btn10.tag = 0
                setStartButton()
            }
        } else {
            btn11.isSelected = !btn11.isSelected
            
            print(sender.tag)
            if btn11.isSelected == true {
                btn11.setImage(UIImage(named: "category_meat_activated_btn"), for: .normal)
                UserDefaults.standard.set(true, forKey: "meat")
                btn11.tag = 1
                setStartButton()
                
            } else {
                btn11.setImage(UIImage(named: "category_meat_inactivated_btn"), for: .normal)
                UserDefaults.standard.set(false, forKey: "meat")
                btn11.tag = 0
                setStartButton()
            }
        }
        
    }
    
    
    
    
    @IBAction func startAction(_ sender: UIButton) {
        if #available(iOS 13.0, *) {
            let tabVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
            tabVC.modalPresentationStyle = .fullScreen
            self.present(tabVC, animated: true, completion: nil)
        } else {
        }
    }
    
    @IBAction func prevAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
