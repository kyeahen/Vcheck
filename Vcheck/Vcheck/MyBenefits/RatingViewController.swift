//
//  RatingViewController.swift
//  Vcheck
//
//  Created by 김예은 on 14/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit
import MXSegmentedPager

class RatingViewController: MXSegmentedPagerController {
    
    @IBOutlet var headerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackBtn()
        self.tabBarController?.tabBar.isHidden = true
    
        segmentedPager.backgroundColor = .white
        
        // Parallax Header
        segmentedPager.parallaxHeader.view = headerView
        segmentedPager.parallaxHeader.mode = .fill
        segmentedPager.parallaxHeader.height = 90
        
        
        
        
        // Segmented Control customization
        segmentedPager.segmentedControl.indicator.linePosition = .bottom
        segmentedPager.segmentedControl.textColor = #colorLiteral(red: 0.6626245975, green: 0.686796546, blue: 0.703777492, alpha: 1)
        segmentedPager.segmentedControl.selectedTextColor = #colorLiteral(red: 0.03668725118, green: 0.7073208094, blue: 0.4985251427, alpha: 1)
        segmentedPager.segmentedControl.indicator.lineView.backgroundColor = #colorLiteral(red: 0.03668725118, green: 0.7073208094, blue: 0.4985251427, alpha: 1)
        segmentedPager.segmentedControl.indicator.lineHeight = 3
        segmentedPager.segmentedControl.font = UIFont(name: AppleSDGothicNeo.Bold.rawValue, size: 15)!
        

    }
    
    override func viewSafeAreaInsetsDidChange() {
        segmentedPager.parallaxHeader.minimumHeight = 60
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, titleForSectionAt index: Int) -> String {
        return ["나의 등급", "등급별 정보"][index]
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, didScrollWith parallaxHeader: MXParallaxHeader) {
        print("progress \(parallaxHeader.progress)")
    }

}
