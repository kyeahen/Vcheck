//
//  FoodViewController.swift
//  Vcheck
//
//  Created by 장용범 on 03/10/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var foods = ["과자/간식","음료","주류","간편식","건강식품"]
    
    var selectedRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setNavigationBar()
    }
    
    @IBAction func selectFilter(_ sender: UIButton) {
        if sender.tag == 100{
            print("신상품")
            let button1 = self.view.viewWithTag(200) as! UIButton
            let button2 = self.view.viewWithTag(300) as! UIButton
            
            
            setButtonGreen(button: sender)
            setButtonGray(button: button1)
            setButtonGray(button: button2)
            
        }else if sender.tag == 200{
            print("구매순")
            let button1 = self.view.viewWithTag(100) as! UIButton
            let button2 = self.view.viewWithTag(300) as! UIButton
            
            setButtonGreen(button: sender)
            setButtonGray(button: button1)
            setButtonGray(button: button2)
            
        }else if sender.tag == 300{
            print("검색순")
            let button1 = self.view.viewWithTag(100) as! UIButton
            let button2 = self.view.viewWithTag(200) as! UIButton
            
            
            setButtonGreen(button: sender)
            setButtonGray(button: button1)
            setButtonGray(button: button2)
            
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setButtonGray(button: UIButton){
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15.0)
        button.setTitleColor(#colorLiteral(red: 0.7194166183, green: 0.740545392, blue: 0.754154861, alpha: 1), for: .normal)
    }
    
    func setButtonGreen(button: UIButton){
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15.0)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.7489138246, blue: 0.5705903172, alpha: 1), for: .normal)
        button.titleLabel?.textColor = #colorLiteral(red: 0, green: 0.7489138246, blue: 0.5705903172, alpha: 1)
    }
    
}

extension FoodViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCollectionViewCell", for: indexPath) as! FoodCollectionViewCell
        
        if indexPath.row == selectedRow {
            cell.label.textColor = #colorLiteral(red: 0, green: 0.7489138246, blue: 0.5705903172, alpha: 1)
            cell.label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15.0)
            cell.bar.isHidden = false
        }else{
            cell.label.textColor = #colorLiteral(red: 0.662745098, green: 0.6862745098, blue: 0.7019607843, alpha: 1)
            cell.label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15.0)
            cell.bar.isHidden = true
        }
        
        cell.label.text = foods[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
        
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        self.collectionView.reloadData()
    }
    
    
    
}

extension FoodViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell", for: indexPath) as! FoodTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
