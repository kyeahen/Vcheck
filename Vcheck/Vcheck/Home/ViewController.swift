//
//  ViewController.swift
//  Vcheck
//
//  Created by 김예은 on 05/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class ViewController: UIViewController {

    @IBOutlet weak var topBannerCollectionView: UICollectionView!
    @IBOutlet weak var recentCollectionView: UICollectionView!
    
    @IBOutlet weak var interestCollectionView: UICollectionView!
    
    @IBOutlet weak var lastCollectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var interestCard: UIImageView!
    
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var lodingView: UIView!
    
    
    let banners: [UIImage] = [
        UIImage(named: "home_top_banner_one_img")!,
        UIImage(named: "home_top_banner_two_img")!,
        UIImage(named: "home_top_banner_three_img")!,
        UIImage(named: "home_top_banner_four_img")!,
        UIImage(named: "home_top_banner_five_img")!
    ]
    
    let recents: [UIImage] = [
        UIImage(named: "home_recentsearch_one")!,
        UIImage(named: "home_recentsearch_two")!,
        UIImage(named: "home_recentsearch_three")!,
        UIImage(named: "home_recentsearch_four")!,
        UIImage(named: "home_recentsearch_five")!,
    ]
    
    let interests: [UIImage] = [
        UIImage(named: "home_newproduct_bigcircle_one")!,
        UIImage(named: "home_newproduct_bigcircle_two")!,
        UIImage(named: "home_newproduct_bigcircle_three")!,
        UIImage(named: "home_newproduct_bigcircle_four")!,
        UIImage(named: "home_newproduct_bigcircle_five")!,
    ]
    
    let lasts: [UIImage] = [
        UIImage(named: "home_interest_one")!,
        UIImage(named: "home_interest_one")!,
        UIImage(named: "home_interest_one")!,
        UIImage(named: "home_interest_one")!,
        UIImage(named: "home_interest_one")!,
        UIImage(named: "home_interest_one")!
    ]
    
    var timer = Timer()
    var timer1 = Timer()
    var count = 0
    var count1 = 0
    
    let imagePicker : UIImagePickerController = UIImagePickerController()
    var imagePickerFlag : Bool = false
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var searchNameLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)

        setNavigationBarClear()
        initCollectionView()
        
        //interestCollectionView.layer.zPosition = 0
        interestCard.layer.zPosition = 3
        pageControl.layer.zPosition = 4
                
        pageControl.numberOfPages = interests.count
        pageControl.currentPage = 0
        
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.changeBanner), userInfo: nil, repeats: true)
        }
        
        DispatchQueue.main.async {
            self.timer1 = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.changeInterest), userInfo: nil, repeats: true)
        }
        
        guard let name = UserDefaults.standard.string(forKey: "name") else {return}
        
        nameLabel.text = name
        searchNameLabel.text = "최근 \(name)님 검색 히스토리에요"
        productNameLabel.text = "최근 \(name)님 관심 상품이에요"
        self.tabBarController?.tabBar.isHidden = false
        self.lodingView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.lodingView.isHidden = true
    }
    
    func setNavigationBarClear() {
        let bar: UINavigationBar! = self.navigationController?.navigationBar
        
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
    }

    
    func initCollectionView(){
        topBannerCollectionView.delegate = self
        topBannerCollectionView.dataSource = self
        recentCollectionView.delegate = self
        recentCollectionView.dataSource = self
        interestCollectionView.delegate = self
        interestCollectionView.dataSource = self
        lastCollectionView.delegate = self
        lastCollectionView.dataSource = self
    }
    
    @IBAction func showMore(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "foodNavi") as! UINavigationController
            
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)

        } else {
            // Fallback on earlier versions
        }
    }
    @IBAction func showSearch(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let vc = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(identifier: "SearchViewController") as! SearchViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else {
        }
    }
    @IBAction func showLast(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let vc = UIStoryboard(name: "Product", bundle: nil).instantiateViewController(identifier: "ProductViewController") as! ProductViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else {
        }
        
    }
    @objc func changeBanner(){
        if count < banners.count{
            let index = IndexPath.init(item: count, section: 0)
            self.topBannerCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            
            count = count + 1
        }else{
            count = 0
           let index = IndexPath.init(item: count, section: 0)
            self.topBannerCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            
        }
    }
    
    @objc func changeInterest(){
        if count1 < interests.count{
            let index = IndexPath.init(item: count1, section: 0)
            self.interestCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            
            pageControl.currentPage = count1
            
            count1 = count1 + 1
        }else{
            count1 = 0
           let index = IndexPath.init(item: count1, section: 0)
            self.interestCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            
            pageControl.currentPage = count1
        }
    }
    
    //MARK: 이미지 검색 액션
    @IBAction func imageSearchAction(_ sender: UIButton) {

        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.view.tintColor = #colorLiteral(red: 0, green: 0.7113869786, blue: 0.5025657415, alpha: 1)

        let cameraAction = UIAlertAction(title: "사진 촬영", style: .default, handler : {
            (action) in
            
            self.openCamera()
        })
        let galleryAction = UIAlertAction(title: "앨범에서 사진 선택", style: .default, handler : {
            (action) in
            
            self.openGallery()
        })

        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(galleryAction)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imageSearch(selectedImage: UIImage) {
        ImageUploadService.postImage(image: selectedImage) { (value) in
            

            if value.food_name == "머드쉐이크 초콜릿" { //X
                let vc = UIStoryboard(name: "ImageSearch", bundle: nil).instantiateViewController(withIdentifier: "ImageSearchXViewController") as! ImageSearchXViewController
                
                vc.products = value
                vc.productImage = selectedImage
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false, completion: nil)
                print(value)
                
            } else if value.food_name == "블루문 벨지움 화이트" {
                let vc = UIStoryboard(name: "ImageSearch", bundle: nil).instantiateViewController(withIdentifier: "ImageSearchViewController") as! ImageSearchViewController
                
                vc.products = value
                vc.productImage = selectedImage
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false, completion: nil)
                print(value)
                
            } else if value.food_name == "수미칩 오리지널" {
                let vc = UIStoryboard(name: "ImageSearch", bundle: nil).instantiateViewController(withIdentifier: "ImageSearchViewController") as! ImageSearchViewController
                
                vc.products = value
                vc.productImage = selectedImage
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false, completion: nil)
                print(value)
            } else if value.food_name == "버드와이저" {
                let vc = UIStoryboard(name: "ImageSearch", bundle: nil).instantiateViewController(withIdentifier: "ImageSearchViewController") as! ImageSearchViewController
                
                vc.products = value
                vc.productImage = selectedImage
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false, completion: nil)
                print(value)
            } else if value.food_name == "포카칩 어니언" { //X
                let vc = UIStoryboard(name: "ImageSearch", bundle: nil).instantiateViewController(withIdentifier: "ImageSearchXViewController") as! ImageSearchXViewController
                
                vc.products = value
                vc.productImage = selectedImage
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                print(value)
            } else if value.food_name == "포테토칩 샤워크림어니언"{
                let vc = UIStoryboard(name: "ImageSearch", bundle: nil).instantiateViewController(withIdentifier: "ImageSearchXViewController") as! ImageSearchXViewController
                
                vc.products = value
                vc.productImage = selectedImage
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false, completion: nil)
                print(value)
            } else {
                //TODO: 에러 처리
            }
        }
    }
    

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topBannerCollectionView{
            return banners.count
        }else if collectionView == recentCollectionView{
            return recents.count
        }else if collectionView == interestCollectionView{
            return interests.count
        }else{
            return lasts.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topBannerCollectionView{
            let cell = topBannerCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeBannerCollectionViewCell", for: indexPath) as! HomeBannerCollectionViewCell
            cell.bannerImage.image = banners[indexPath.row]
            
            return cell
        }else if collectionView == recentCollectionView{
            let cell = recentCollectionView.dequeueReusableCell(withReuseIdentifier: "RecentCollectionViewCell", for: indexPath) as! RecentCollectionViewCell
            cell.recentImage.image = recents[indexPath.row]
            
            return cell
        }else if collectionView == interestCollectionView{
            let cell = interestCollectionView.dequeueReusableCell(withReuseIdentifier: "InterestCollectionViewCell", for: indexPath) as! InterestCollectionViewCell
            cell.interestImage.image = interests[indexPath.row]
            cell.interestImage.cornerRadius = cell.interestImage.frame.height/2

            return cell
        }else{
            let cell = lastCollectionView.dequeueReusableCell(withReuseIdentifier: "LastCollectionViewCell", for: indexPath) as! LastCollectionViewCell
            cell.lastImage.image = lasts[indexPath.row]
            
            
            return cell
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == topBannerCollectionView{
            return CGSize(width: 375, height: 194)
        }else if collectionView == recentCollectionView{
            return CGSize(width: 110, height: 125)
        }else if collectionView == interestCollectionView{
            return CGSize(width: 414, height: 316)
        }else{
            return CGSize(width: 110, height: 125)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
}

//MARK: 이미지 첨부 Extension
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //Method : 갤러리를 여는 함수
    @objc func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.delegate = self
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: { print("이미지 피커 나옴") })
        }
    }
    
    //Method : 카메라를 여는 함수
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.imagePicker.sourceType = .camera
            self.imagePicker.delegate = self
            self.present(self.imagePicker, animated: true, completion: { print("이미지 피커 나옴") })
        }
    }
    
    // imagePickerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("사용자가 취소함")
        self.dismiss(animated: true) {
            print("이미지 피커 사라짐")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[.editedImage] as? UIImage {

            self.imageSearch(selectedImage: editedImage)
            self.imagePickerFlag = true
            
            self.lodingView.isHidden = false
            
            self.productImageView.image = editedImage
            self.gifImageView.loadGif(name: "imgloading")

        } else if let selectedImage = info[.originalImage] as? UIImage {
            
            self.imageSearch(selectedImage: selectedImage)
            self.imagePickerFlag = true
            
            self.lodingView.isHidden = false
            self.productImageView.image = selectedImage
            self.gifImageView.loadGif(name: "imgloading")
        }
        
        self.dismiss(animated: true) {
            print("이미지 피커 사라짐")
        }
    }
    
}



