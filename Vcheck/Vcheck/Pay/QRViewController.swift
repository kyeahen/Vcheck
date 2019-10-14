//
//  QRViewController.swift
//  Vcheck
//
//  Created by 장용범 on 26/09/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit
import AVFoundation

class QRViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, AVCaptureMetadataOutputObjectsDelegate {

    @IBOutlet weak var cameraView: UIView!
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    var picker: UIImagePickerController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        
        qr()
        
        //addImagePickerToContainerView()

    }
    
    func qr(){
        captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            failed()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = cameraView.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        cameraView.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }
        
        //dismiss(animated: true)
    }
    
    func found(code: String) {
        print(code)
        if #available(iOS 13.0, *) {
            let vc = self.storyboard?.instantiateViewController(identifier: "PayCheckViewController") as! PayCheckViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            // Fallback on earlier versions
        }
    }
    
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
//            if #available(iOS 13.0, *) {
//                let vc = self.storyboard?.instantiateViewController(identifier: "PayCheckViewController") as! PayCheckViewController
//                self.navigationController?.pushViewController(vc, animated: true)
//            } else {
//                // Fallback on earlier versions
//            }
//
//
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
            //picker?.view.widthAnchor.constraint(equalToConstant: cameraView.frame.width)
            //picker?.view.heightAnchor.constraint(equalToConstant: cameraView.frame.height)
            //picker?.view.frame = CGRect(x: 19.5, y: 109.0, width: 375, height: 250)
            picker?.view.frame = cameraView.bounds
            //print(picker.view.contentMode)
            picker?.view.contentMode = .scaleAspectFill
            print(cameraView.frame)
            print(picker?.view.frame)
            
            //picker?.view.center = cameraView.center
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
