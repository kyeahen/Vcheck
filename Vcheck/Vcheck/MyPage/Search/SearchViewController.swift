//
//  SearchViewController.swift
//  Vcheck
//
//  Created by 김예은 on 15/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchTableView: UITableView!
    
    let imageArr : [UIImage] = [UIImage(named: "home_recentsearch_one.png")!, UIImage(named: "home_recentsearch_two.png")!, UIImage(named: "home_recentsearch_three.png")!, UIImage(named: "home_recentsearch_five.png")!, UIImage(named: "home_recentsearch_six.png")!]
    
    let titleArr : [String] = ["아몬드 밀크", "머드쉐이크 초콜릿", "수미칩 오리지널", "한 입 김말이", "튀김 칼국수"]
    let brandArr : [String] = ["137 degrees", "인디펜던트리쿼", "농심", "올가", "삼양"]
    var statusArr : [Int] = [1, 0, 1, 1, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        setBackBtn()
    }
    
    func setTableView() {
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.tableFooterView = UIView(frame: .zero)
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        cell.productImageView.image = imageArr[indexPath.row]
        cell.titleLabel.text = titleArr[indexPath.row]
        cell.brandLabel.text = brandArr[indexPath.row]
        cell.bookmarkButton.tag = indexPath.row
        cell.bookmarkButton.addTarget(self, action: #selector(SearchViewController.bookmarkAction(_:)), for: .touchUpInside)
        
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
        
        self.searchTableView.reloadData()
        
        print(statusArr[tag])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let popUpVC = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "SearchPopUpViewController") as! SearchPopUpViewController
        
        popUpVC.index = indexPath.row
        
        self.addChild(popUpVC)
        popUpVC.view.frame = self.view.frame
        self.view.addSubview(popUpVC.view)
        popUpVC.didMove(toParent: self)
    }
    
}



