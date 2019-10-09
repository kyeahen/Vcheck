//
//  QRViewController.swift
//  Vcheck
//
//  Created by 장용범 on 26/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class QRViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var cameraView: UIView!
    
    var picker: UIImagePickerController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        
        addImagePickerToContainerView()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            if #available(iOS 13.0, *) {
                let vc = self.storyboard?.instantiateViewController(identifier: "PayCheckViewController") as! PayCheckViewController
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                // Fallback on earlier versions
            }
            
            
        }
    }
    
    
    func addImagePickerToContainerView(){

        picker = UIImagePickerController()
        if UIImagePickerController.isCameraDeviceAvailable( UIImagePickerController.CameraDevice.front) {
            picker?.delegate = self
            picker?.sourceType = UIImagePickerController.SourceType.camera

            //add as a childviewcontroller
            addChild(picker!)

            // Add the child's View as a subview
            self.cameraView.addSubview((picker?.view)!)
            picker?.view.frame = cameraView.bounds
            picker?.allowsEditing = false
            picker?.showsCameraControls = false
            picker?.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
