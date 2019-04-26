//
//  Media.swift
//  soccus
//
//  Created by Truman Purnell on 4/25/19.
//  Copyright © 2019 Truman Purnell. All rights reserved.
//

import AVFoundation

class Media {
    var camera: AVCaptureDevice?
    var microphone: AVCaptureDevice?
    
    var videoBuffer: DispatchQueue
    // AUDIO BUFFER ?
    
    var captureSession: AVCaptureSession
    
    var deviceTypes: [AVCaptureDevice.DeviceType] = [
        .builtInDualCamera,
        .builtInTelephotoCamera,
        .builtInWideAngleCamera
    ]


    init(captureSession: AVCaptureSession){
        self.captureSession = AVCaptureSession()
        
        self.camera = AVCaptureDevice.default(for: .video)
        self.microphone = AVCaptureDevice.default(for: .audio)
        
        self.videoBuffer = DispatchQueue.global(qos: .userInteractive)
    }
    
    
    private func setupCaptureSession() {
        do {
            
            captureSession.addInput(try AVCaptureDeviceInput(device: camera!))
            captureSession.addInput(try AVCaptureDeviceInput(device: microphone!))
            
            let preview = AVCaptureVideoPreviewLayer(session: captureSession)
            preview.frame = view.bounds
            preview.backgroundColor = UIColor.black.cgColor
            preview.videoGravity = .resizeAspect
            view.layer.addSublayer(preview)
            self.previewLayer = preview
            
            let output = AVCaptureVideoDataOutput()
            output.alwaysDiscardsLateVideoFrames = true
            output.setSampleBufferDelegate(self, queue: bufferQueue)
            
            captureSession.addOutput(output)
            captureSession.startRunning()
            
        } catch let e {
            print("Error creating capture session: \(e)")
            return
        }
    }
    
}

extension Media : AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
    }
}

