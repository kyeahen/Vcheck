//
//  ProductViewController.swift
//  Vcheck
//
//  Created by 김예은 on 14/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productTableView: UITableView!
    
    let imageArr : [UIImage] = [UIImage(named: "home_recentsearch_four.png")!, UIImage(named: "home_recentsearch_five.png")!, UIImage(named: "home_recentsearch_three.png")!]
    let titleArr : [String] = ["아몬드브리즈 오리지널", "한 입 김말이", "수미칩 오리지널"]
    let brandArr : [String] = ["매일", "올가", "농심"]
    var statusArr : [Int] = [0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTableView()
        setBackBtn()
    }
    
    func setTableView() {
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.tableFooterView = UIView(frame: .zero)
    }

}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        
        cell.productImageView.image = imageArr[indexPath.row]
        cell.titleLabel.text = titleArr[indexPath.row]
        cell.brandLabel.text = brandArr[indexPath.row]
        cell.bookmarkButton.tag = indexPath.row
        cell.bookmarkButton.addTarget(self, action: #selector(ProductViewController.bookmarkAction(_:)), for: .touchUpInside)
        
        if statusArr[indexPath.row] == 0 {
        cell.bookmarkButton.setBackgroundImage(UIImage(named: "bookmark_inactivated_icon.png"), for: .normal)
        } else {
        cell.bookmarkButton.setBackgroundImage(UIImage(named: "bookmark_activated_icon.png"), for: .normal)
        }
        
        return cell
    }
    
    @objc func bookmarkAction(_ sender: UIButton) {
        let tag = sender.tag
        
        if statusArr[tag] == 0 {
            statusArr[tag] = 1
        } else {
            statusArr[tag] = 0
        }
        
        self.productTableView.reloadData()
        
        print(statusArr[tag])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let popUpVC = UIStoryboard(name: "Product", bundle: nil).instantiateViewController(withIdentifier: "ProductPopUpViewController") as! ProductPopUpViewController
        
        popUpVC.index = indexPath.row
        
        self.addChild(popUpVC)
        popUpVC.view.frame = self.view.frame
        self.view.addSubview(popUpVC.view)
        popUpVC.didMove(toParent: self)
    }
    
}
