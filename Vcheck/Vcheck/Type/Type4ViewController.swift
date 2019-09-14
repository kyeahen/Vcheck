//
//  Type4ViewController.swift
//  Vcheck
//
//  Created by 김예은 on 14/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class Type4ViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setCustomView()
    }
    
    func setCustomView() {
        imageView1.circleImageView()
        imageView2.circleImageView()
        imageView3.circleImageView()
    }
    

}
