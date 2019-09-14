//
//  RatingDataViewController.swift
//  Vcheck
//
//  Created by 김예은 on 14/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class RatingDataViewController: UIViewController {

    @IBOutlet weak var ratingTableView: UITableView!
    
    let ratingImageArr : [UIImage] = [UIImage(named: "membership_rating_info_basiccheck_card.png")!, UIImage(named: "membership_rating_info_doblecheck_card.png")!, UIImage(named: "membership_rating_info_triplecheck_card.png")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTableView()
    }
    
    func setTableView() {
        ratingTableView.delegate = self
        ratingTableView.dataSource = self
    }


}

extension RatingDataViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ratingImageArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RatingTableViewCell", for: indexPath) as! RatingTableViewCell
        
        cell.ratingImageView.image = ratingImageArr[indexPath.row]
        
        return cell
    }
    
    
}
