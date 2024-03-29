//
//  SearchPopUpViewController.swift
//  Vcheck
//
//  Created by 김예은 on 15/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class SearchPopUpViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    
    var index : Int = 0
    
     let imageArr : [UIImage] = [UIImage(named: "home_recentsearch_one.png")!, UIImage(named: "home_recentsearch_two.png")!, UIImage(named: "home_recentsearch_three.png")!, UIImage(named: "home_recentsearch_five.png")!, UIImage(named: "home_recentsearch_six.png")!]
    
    let titleArr : [String] = ["아몬드 밀크",
    "머드쉐이크 밀크",
    """
    수미칩
    오리지널
    """, "한 입 김말이", "튀김 칼국수"]
    
     let brandArr : [String] = ["137 degrees", "인디펜던트리쿼", "농심", "올가", "삼양"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showAnimate()
        setCustomView()
    }
    
    func setCustomView() {
        backView.makeRounded(cornerRadius: 16)
        productImageView.image = imageArr[index]
        titleLabel.text = titleArr[index]
        brandLabel.text = brandArr[index]
    }
    
    func showAnimate()
    {
//        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
//            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
//            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    
    //MARK: 취소하기 액션
    @IBAction func closeAction(_ sender: Any) {
        self.removeAnimate()
    }
    
    
}


