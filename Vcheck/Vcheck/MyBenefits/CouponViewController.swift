//
//  CouponViewController.swift
//  Vcheck
//
//  Created by 김예은 on 14/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class CouponViewController: UIViewController {

    @IBOutlet weak var couponTableView: UITableView!
    
    let couponImageArr : [UIImage] = [UIImage(named: "membership_coupon_one.png")!, UIImage(named: "membership_coupon_two.png")!, UIImage(named: "membership_coupon_three.png")!, UIImage(named: "membership_coupon_four.png")!, UIImage(named: "membership_coupon_five.png")!, UIImage(named: "membership_coupon_six.png")!,]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTableView()
    }
    
    func setTableView() {
        couponTableView.delegate = self
        couponTableView.dataSource = self
    }
    
    @IBAction func dismissAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

extension CouponViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return couponImageArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CouponTableViewCell", for: indexPath) as! CouponTableViewCell
        
        cell.couponImageView.image = couponImageArr[indexPath.row]
        
        return cell
        
    }
    
    
}
