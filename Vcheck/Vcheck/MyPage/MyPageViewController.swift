//
//  MyPageViewController.swift
//  Vcheck
//
//  Created by 장용범 on 09/10/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initBackView()
        setNavigationBar()
        nameLabel.text = UserDefaults.standard.string(forKey: "name") ?? ""
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func initBackView(){
        backView.makeRounded(cornerRadius: 30)
        
        backView.layer.borderWidth = 1
        backView.layer.borderColor = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
        backView.layer.zPosition = 2
    }
    
    @IBAction func review(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "ReviewViewController") as! ReviewViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            // Fallback on earlier versions
        }
    }
    
    @IBAction func interest(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let vc = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(identifier: "SearchViewController") as! SearchViewController
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            // Fallback on earlier versions
        }
    }
    @IBAction func search(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let vc = UIStoryboard(name: "Product", bundle: nil).instantiateViewController(identifier: "ProductViewController") as! ProductViewController
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            // Fallback on earlier versions
        }
    }
    @IBAction func setting(_ sender: Any) {
    }
    @IBAction func logout(_ sender: Any) {
    }
}
