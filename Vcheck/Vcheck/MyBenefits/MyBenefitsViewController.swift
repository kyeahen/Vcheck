//
//  MyBenefitsViewController.swift
//  Vcheck
//
//  Created by 김예은 on 14/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class MyBenefitsViewController: UIViewController {
    
    enum Direction {
        case right
        case left
    }
    
    var finalOffset : CGFloat = 0
    var startOffset  : CGFloat = 0
    var currentIdx = 0
    
    let titleArr : [String] = ["프리미엄 컬쳐", "비건샵/식당 쿠폰", "사회적 기부"]
    let msgArr : [String] = ["월 2회 비건 컬쳐를 누려보세요", "총 8개의 쿠폰을 제공해드려요", "결제 금액의 2%가 기부됩니다"]
    
    @IBOutlet weak var benefitCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var msgLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setCollectionView()
    }
    
    func setCollectionView() {
        benefitCollectionView.delegate = self
        benefitCollectionView.dataSource = self
    }
    
    @IBAction func couponAction(_ sender: UITapGestureRecognizer) {
        let couponVC = UIStoryboard(name: "MyBenefits", bundle: nil).instantiateViewController(withIdentifier: "couponNaviVC")
        self.present(couponVC, animated: true, completion: nil)
    }
    
}

extension MyBenefitsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyBenefits1CollectionViewCell", for: indexPath) as! MyBenefits1CollectionViewCell
            
            return cell
            
        } else if indexPath.row == 1 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyBenefits2CollectionViewCell", for: indexPath) as! MyBenefits2CollectionViewCell
            
            return cell
            
        } else  {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyBenefits3CollectionViewCell", for: indexPath) as! MyBenefits3CollectionViewCell
            
            return cell
            
        }
    }
    
    
}


//MARK: - CollectionView drag
extension MyBenefitsViewController : UIScrollViewDelegate {
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
        
        let numberOfItems = benefitCollectionView.numberOfItems(inSection: 0)
        let safeIndex = max(0, min(numberOfItems - 1, index))
        currentIdx = safeIndex
        return safeIndex
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startOffset = benefitCollectionView.contentOffset.x
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        finalOffset = benefitCollectionView.contentOffset.x
        //stop scrollview sliding
        targetContentOffset.pointee = scrollView.contentOffset
        
        if finalOffset > startOffset {
            //뒤로 넘기기
            let majorIdx = indexOfMajorCell(direction: .right)
            let indexPath = IndexPath(row: majorIdx, section: 0)
            benefitCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
            titleLabel.text = titleArr[currentIdx]
            msgLabel.text = msgArr[currentIdx]
            
        } else if finalOffset < startOffset {
            //앞으로 가기
            let majorIdx = indexOfMajorCell(direction: .left)
            let indexPath = IndexPath(row: majorIdx, section: 0)
            benefitCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
            titleLabel.text = titleArr[currentIdx]
            msgLabel.text = msgArr[currentIdx]
            
        } else {
            print("둘다 아님")
        }
    }
}




