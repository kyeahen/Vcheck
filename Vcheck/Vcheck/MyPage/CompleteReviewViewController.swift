//
//  CompleteReviewViewController.swift
//  Vcheck
//
//  Created by 장용범 on 09/10/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class CompleteReviewViewController: UIViewController {

    @IBOutlet weak var reviewTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setBackBtn()
        navigationItem.backBarButtonItem?.title = ""

        
        reviewTextView.delegate = self

    }
    

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func submit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func textViewSetup(){
        if reviewTextView.text == "상품 후기를 작성해주세요"{
            reviewTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            reviewTextView.text = ""
        }else{
            reviewTextView.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            reviewTextView.text = "상품 후기를 작성해주세요"
        }
    }
  
}

extension CompleteReviewViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        textViewSetup()
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == ""{
            textViewSetup()
        }
    }
}
