//
//  PayCardViewController.swift
//  Vcheck
//
//  Created by 장용범 on 26/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class PayCardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setNavigationBar()
        setBackBtn()


        // Do any additional setup after loading the view.
    }
    @IBAction func ok(_ sender: Any) {
        if #available(iOS 13.0, *) {
            //let navi = storyboard?.instantiateViewController(identifier: "payCompleteNavi") as! UINavigationController
            let vc = storyboard?.instantiateViewController(identifier: "PayCompleteViewController") as! PayCompleteViewController
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            // Fallback on earlier versions
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
