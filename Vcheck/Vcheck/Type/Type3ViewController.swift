//
//  Type3ViewController.swift
//  Vcheck
//
//  Created by 김예은 on 14/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class Type3ViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    
    var selectedIndex = 0
    
    let categoryArr : [String] = ["비건", "락토", "오보", "락토오보", "페스코", "폴로"]
    let cardImageArr : [UIImage] = [UIImage(named: "category_vegan_img.png")!, UIImage(named: "category_lacto_img.png")!, UIImage(named: "category_ovo_img.png")!, UIImage(named: "category_lactoovo_img.png")!, UIImage(named: "category_pesco_img.png")!, UIImage(named: "category_polo_img.png")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
        setCusomView()
    }
    
    func setCollectionView() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    func setCusomView() {
        imageView1.circleImageView()
        imageView2.circleImageView()
        imageView3.circleImageView()
        
        setNavigationBar()
        self.navigationItem.hidesBackButton = true
    }
    
    //MARK: 13버전
    @IBAction func startAction(_ sender: UIButton) {
        
        if #available(iOS 13.0, *) {
            let tabVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
            tabVC.modalPresentationStyle = .fullScreen
            self.present(tabVC, animated: true, completion: nil)
        } else {
            
        }
    }
    
    @IBAction func prevAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension Type3ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Type3CollectionViewCell", for: indexPath) as! Type3CollectionViewCell
        
        if selectedIndex == indexPath.row {
            cell.categoryView.backgroundColor = #colorLiteral(red: 0, green: 0.7113869786, blue: 0.5025657415, alpha: 1)
            cell.categoryLabel.textColor = UIColor.white
            categoryImageView.image = cardImageArr[indexPath.row]
        } else {
            cell.categoryView.backgroundColor = #colorLiteral(red: 0.9332516193, green: 0.9333857298, blue: 0.9332222342, alpha: 1)
            cell.categoryLabel.textColor = #colorLiteral(red: 0.5244067311, green: 0.5536825061, blue: 0.5662248731, alpha: 1)
        }
        
        cell.categoryLabel.text = categoryArr[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        selectedIndex = indexPath.row
        self.categoryCollectionView.reloadData()
    }
    
    
}
