//
//  testViewController.swift
//  Vcheck
//
//  Created by 김예은 on 04/10/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class testViewController: UIViewController {

    
    let imagePicker : UIImagePickerController = UIImagePickerController()
    var imagePickerFlag : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ac(_ sender: UIButton) {
        
        /* UIAlertController는 alert(우리가 흔히 보는 팝업창), actionSheet을 지원합니다.
        우리는 actionSheet을 사용할 것이기 때문에 actionSheet Style의 UIAlertController 객체를 생성합니다. */
        
        let actionSheet = UIAlertController(title: "", message: "방법을 선택해주세요.", preferredStyle: .actionSheet)
        
        /* ActionSheet에서 사용할 Action을 정의합니다.
        Action Style는 default, cancle, destructive를 지원합니다. */
        let cameraAction = UIAlertAction(title: "사진 촬영", style: .default, handler : {
            (action) in
            
            //handler에는 해당 Action을 누르면 동작해야할 코드를 작성합니다.
            self.openCamera()
        })
        let galleryAction = UIAlertAction(title: "앨범에서 사진 선택", style: .default, handler : {
            (action) in
            
            //handler에는 해당 Action을 누르면 동작해야할 코드를 작성합니다.
            self.openGallery()
        })
        //취소 액션에는 딱히 동작할 코드가 없기 때문에 그냥 nil로 설정합니다.
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        //ActionSheet 객체에 위에서 정의한 3개의 액션을 추가합니다.
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(galleryAction)
        actionSheet.addAction(cancelAction)
        
        //화면에 ActionSheet을 띄웁니다.
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    func imageSearch(selectedImage: UIImage) {
        ImageUploadService.postImage(image: selectedImage) { (value) in
            if value.food_name == "머드쉐이크 초콜릿" {
                let vc = UIStoryboard(name: "ImageSearch", bundle: nil).instantiateViewController(withIdentifier: "ImageSearchXViewController") as! ImageSearchXViewController
                
                vc.products = value
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                print(value)
                
            } else if value.food_name == "블루문 벨지움 화이트" {
                let vc = UIStoryboard(name: "ImageSearch", bundle: nil).instantiateViewController(withIdentifier: "ImageSearchViewController") as! ImageSearchViewController
                
                vc.products  = value
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                print(value)
                
            } else if value.food_name == "수미칩 오리지널" {
                let vc = UIStoryboard(name: "ImageSearch", bundle: nil).instantiateViewController(withIdentifier: "ImageSearchViewController") as! ImageSearchViewController
                
                vc.products  = value
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                print(value)
            } else if value.food_name == "버드와이저" {
                let vc = UIStoryboard(name: "ImageSearch", bundle: nil).instantiateViewController(withIdentifier: "ImageSearchViewController") as! ImageSearchViewController
                
                vc.products  = value
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                print(value)
            } else if value.food_name == "포카칩 어니언" {
                let vc = UIStoryboard(name: "ImageSearch", bundle: nil).instantiateViewController(withIdentifier: "ImageSearchXViewController") as! ImageSearchXViewController
                
                vc.products  = value
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                print(value)
            } else if value.food_name == "포테토칩 샤워크림어니언"{
                let vc = UIStoryboard(name: "ImageSearch", bundle: nil).instantiateViewController(withIdentifier: "ImageSearchXViewController") as! ImageSearchXViewController
                
                vc.products = value
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                print(value)
            } else {
                //TODO: 에러 처리
            }
        }
    }

}

//MARK: 이미지 첨부 Extension
extension testViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
//            imageView.image = editedImage
//            imageView.image = editedImage
            self.imageSearch(selectedImage: editedImage)
            self.imagePickerFlag = true

        } else if let selectedImage = info[.originalImage] as? UIImage {
//            imageView.image = selectedImage
//            imageView.image = selectedImage
            
            self.imageSearch(selectedImage: selectedImage)
            self.imagePickerFlag = true
        }
        
        self.dismiss(animated: true) {
            print("이미지 피커 사라짐")
        }
    }
    
}

