//
//  PayReceiptViewController.swift
//  Vcheck
//
//  Created by 장용범 on 09/10/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class PayReceiptViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        navigationItem.backBarButtonItem?.title = ""
        setBackBtn()


    }
    

    @IBAction func pay(_ sender: Any) {
        if #available(iOS 13.0, *) {
            //let navi = storyboard?.instantiateViewController(identifier: "payCardNavi") as! UINavigationController
            let vc = storyboard?.instantiateViewController(identifier: "PayCardViewController") as! PayCardViewController
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
            //present(vc, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
        }
    }
    
}
