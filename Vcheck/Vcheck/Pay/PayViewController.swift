//
//  PayViewController.swift
//  Vcheck
//
//  Created by 장용범 on 26/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit
import CTSlidingUpPanel

class PayViewController: UIViewController {

    enum Direction {
        case right
        case left
    }
    
    var finalOffset : CGFloat = 0
    var startOffset  : CGFloat = 0
    var currentIdx = 0
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var bottomView: UIView!
    var bottomController : CTBottomSlideController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout.invalidateLayout()
        
        bottomView.makeRounded(cornerRadius: 30)
        
        bottomView.layer.borderWidth = 1
        bottomView.layer.borderColor = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
        bottomView.layer.zPosition = 2
        
        bottomController = CTBottomSlideController(parent: view, bottomView: bottomView, tabController: self.tabBarController!, navController: self.navigationController, visibleHeight: 166)
        
        bottomView.clipsToBounds = true
    
        bottomController?.setAnchorPoint(anchor: 1.0)
        bottomController?.delegate = self

        // Do any additional setup after loading the view.
    }
    @IBAction func goQR(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let navi = storyboard?.instantiateViewController(identifier: "QRNavi") as! UINavigationController
            navi.modalPresentationStyle = .fullScreen
            present(navi, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
        }
    }
    
    
}

extension PayViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PayCardCollectionViewCell", for: indexPath) as! PayCardCollectionViewCell
        
        if indexPath.row == 0{
            cell.cardimage.image = UIImage(named: "payment_card_one.png")
        }else if indexPath.row == 1{
            cell.cardimage.image = UIImage(named: "payment_card_two.png")
        }else{
            cell.cardimage.image = UIImage(named: "payment_card_plus.png")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row != 2 {
            if #available(iOS 13.0, *) {
                let navi = storyboard?.instantiateViewController(identifier: "QRNavi") as! UINavigationController
                navi.modalPresentationStyle = .fullScreen
                present(navi, animated: true, completion: nil)
            } else {
                // Fallback on earlier versions
            }
        }
        
        
    }
    
    
}

extension PayViewController : UIScrollViewDelegate {
    /**
     현재 메인셀의 인덱스를 구하는 함수
     */
    private func indexOfMajorCell(direction : Direction) -> Int {
        var index = 0
        
        switch direction {
        case .right :
            index = currentIdx + 1
        case .left :
            index = currentIdx - 1
        }
        
        let numberOfItems = collectionView.numberOfItems(inSection: 0)
        let safeIndex = max(0, min(numberOfItems - 1, index))
        currentIdx = safeIndex
        return safeIndex
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startOffset = collectionView.contentOffset.x
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        finalOffset = collectionView.contentOffset.x
        //stop scrollview sliding
        targetContentOffset.pointee = scrollView.contentOffset
        
        if finalOffset > startOffset {
            //뒤로 넘기기
            let majorIdx = indexOfMajorCell(direction: .right)
            let indexPath = IndexPath(row: majorIdx, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
           
            
        } else if finalOffset < startOffset {
            //앞으로 가기
            let majorIdx = indexOfMajorCell(direction: .left)
            let indexPath = IndexPath(row: majorIdx, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        } else {
            print("둘다 아님")
        }
    }
}


// Bottom Slide

extension PayViewController: CTBottomSlideDelegate{
    func didPanelCollapse() {
        bottomView.layoutIfNeeded()
    }
    
    func didPanelExpand() {
        bottomView.layoutIfNeeded()
    }
    
    func didPanelAnchor() {
         
    }
    
    func didPanelMove(panelOffset: CGFloat) {
         
    }
    
    
}
