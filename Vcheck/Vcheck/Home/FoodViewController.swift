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
    
    var foodImages: [UIImage] = []
    
    var data: [[UIImage]] = []
    
    var snacks: [UIImage] = [
        UIImage(named: "ranking_snack_one")!,
        UIImage(named: "ranking_snack_two")!,
        UIImage(named: "ranking_snack_three")!,
        UIImage(named: "ranking_snack_four")!,
        UIImage(named: "ranking_snack_five")!,
        UIImage(named: "ranking_snack_six")!,
        UIImage(named: "ranking_snack_seven")!,
        UIImage(named: "ranking_snack_eight")!,
        UIImage(named: "ranking_snack_nine")!,
        UIImage(named: "ranking_snack_ten")!
    ]
    
    var liquors: [UIImage] = [
        UIImage(named: "ranking_liquor_one")!,
        UIImage(named: "ranking_liquor_two")!,
        UIImage(named: "ranking_liquor_three")!,
        UIImage(named: "ranking_liquor_four")!,
        UIImage(named: "ranking_liquor_five")!,
        UIImage(named: "ranking_liquor_six")!,
        UIImage(named: "ranking_liquor_seven")!,
        UIImage(named: "ranking_liquor_eight")!,
        UIImage(named: "ranking_liquor_nine")!,
        UIImage(named: "ranking_liquor_ten")!
    ]
    
    var drinks: [UIImage] = [
        UIImage(named: "ranking_drink_one")!,
        UIImage(named: "ranking_drink_two")!,
        UIImage(named: "ranking_drink_three")!,
        UIImage(named: "ranking_drink_four")!,
        UIImage(named: "ranking_drink_five")!,
        UIImage(named: "ranking_drink_six")!,
        UIImage(named: "ranking_drink_seven")!,
        UIImage(named: "ranking_drink_eight")!,
        UIImage(named: "ranking_drink_nine")!,
        UIImage(named: "ranking_drink_ten")!
    ]
    
    var hmrs: [UIImage] = [
        UIImage(named: "ranking_hmr_one")!,
        UIImage(named: "ranking_hmr_two")!,
        UIImage(named: "ranking_hmr_three")!,
        UIImage(named: "ranking_hmr_four")!,
        UIImage(named: "ranking_hmr_five")!,
        UIImage(named: "ranking_hmr_six")!,
        UIImage(named: "ranking_hmr_seven")!,
        UIImage(named: "ranking_hmr_eight")!,
        UIImage(named: "ranking_hmr_nine")!,
        UIImage(named: "ranking_hmr_ten")!
    ]
    
    var healthfoods: [UIImage] = [
        UIImage(named: "ranking_healthfood_one")!,
        UIImage(named: "ranking_healthfood_two")!,
        UIImage(named: "ranking_healthfood_three")!,
        UIImage(named: "ranking_healthfood_four")!,
        UIImage(named: "ranking_healthfood_five")!,
        UIImage(named: "ranking_healthfood_six")!,
        UIImage(named: "ranking_healthfood_seven")!,
        UIImage(named: "ranking_healthfood_eight")!,
        UIImage(named: "ranking_healthfood_nine")!,
        UIImage(named: "ranking_healthfood_ten")!
    ]
   
    
    
    var selectedRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        foodImages = data[0]

        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        setNavigationBar()
    }
    
    func initData(){
        data.append(snacks)
        data.append(drinks)
        data.append(liquors)
        data.append(hmrs)
        data.append(healthfoods)
    }
    
    @IBAction func selectFilter(_ sender: UIButton) {
        if sender.tag == 100{
            let button1 = self.view.viewWithTag(200) as! UIButton
            let button2 = self.view.viewWithTag(300) as! UIButton
            
            
            setButtonGreen(button: sender)
            setButtonGray(button: button1)
            setButtonGray(button: button2)
            
        }else if sender.tag == 200{
            let button1 = self.view.viewWithTag(100) as! UIButton
            let button2 = self.view.viewWithTag(300) as! UIButton
            
            setButtonGreen(button: sender)
            setButtonGray(button: button1)
            setButtonGray(button: button2)
            
        }else if sender.tag == 300{
            let button1 = self.view.viewWithTag(100) as! UIButton
            let button2 = self.view.viewWithTag(200) as! UIButton
            
            
            setButtonGreen(button: sender)
            setButtonGray(button: button1)
            setButtonGray(button: button2)
            
        }
        
        foodImages.shuffle()
        tableView.reloadData()
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
        return CGSize(width: 80, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
        
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        foodImages = data[selectedRow]
        
        self.tableView.reloadData()
        self.collectionView.reloadData()
    }
    
    
    
}

extension FoodViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell", for: indexPath) as! FoodTableViewCell
        
        cell.foodImage.image = foodImages[indexPath.row]
        cell.foodNum.text = "\(indexPath.row + 1)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
