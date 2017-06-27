//
//  ViewController.swift
//  Custom Camera
//
//  Created by 王富生 on 2017/4/5.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let captureSession = AVCaptureSession()
    var previewLayer: CALayer!
    
    var captureDevice: AVCaptureDevice!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCamera()
    }

    func prepareCamera() {
        captureSession.sessionPreset = AVCaptureSessionPresetPhoto
        
        if let availableDevice = AVCaptureDeviceDiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaTypeVideo, position: .back).devices {
            
            captureDevice = availableDevice.first
            beginSession()
        }
    }
    
    func beginSession() {
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(captureDeviceInput)
        } catch {
            print(error.localizedDescription)
        }
        
        if let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession) {
            self.previewLayer = previewLayer
            self.view.layer.addSublayer(self.previewLayer)
            self.previewLayer.frame = self.view.layer.frame
            
            captureSession.startRunning()
            
            let dataOutput = AVCaptureVideoDataOutput()
            dataOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as NSString: NSNumber (value: kCVPixelFormatType_32BGRA)]
            
            dataOutput.alwaysDiscardsLateVideoFrames = true
            
            if captureSession.canAddOutput(dataOutput) {
                captureSession.addOutput(dataOutput)
            }
        }
    }

}

