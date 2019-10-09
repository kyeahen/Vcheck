//
//  PayCompleteViewController.swift
//  Vcheck
//
//  Created by 장용범 on 26/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class PayCompleteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()


        // Do any additional setup after loading the view.
    }
    @IBAction func ok(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let tabVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
            tabVC.modalPresentationStyle = .fullScreen
            self.present(tabVC, animated: true, completion: nil)
        } else {
        }
    }
    
    @IBAction func close(_ sender: Any) {
        
        //dismiss(animated: true, completion: nil)
        if #available(iOS 13.0, *) {
            let tabVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
            tabVC.modalPresentationStyle = .fullScreen
            self.present(tabVC, animated: true, completion: nil)
        } else {
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
