//
//  ConsumptiveMedia.swift
//  soccus
//
//  Created by Truman Purnell on 4/25/19.
//  Copyright © 2019 Truman Purnell. All rights reserved.
//

import AVFoundation

class ConsumptiveMedia : NSObject {
    var camera: AVCaptureDevice?
    var microphone: AVCaptureDevice?
    
    var videoQueue: DispatchQueue
    var audioQueue: DispatchQueue
    
    var videoBuffer: AVCaptureVideoDataOutput
    var audioBuffer: AVCaptureAudioDataOutput
    
    var captureSession: AVCaptureSession
    
    override init(){
        self.captureSession = AVCaptureSession()
        
        self.camera = AVCaptureDevice.default(for: .video)
        self.microphone = AVCaptureDevice.default(for: .audio)
        
        self.videoQueue = DispatchQueue.global(qos: .userInteractive)
        self.audioQueue = DispatchQueue.global(qos: .userInteractive)
        
        self.videoBuffer = AVCaptureVideoDataOutput()
        self.audioBuffer = AVCaptureAudioDataOutput()
    }
    
    public func capture() {
        do {
            captureSession.addInput(try AVCaptureDeviceInput(device: camera!))
            captureSession.addInput(try AVCaptureDeviceInput(device: microphone!))
            
            
            videoBuffer.alwaysDiscardsLateVideoFrames = true
            videoBuffer.setSampleBufferDelegate(self, queue: videoQueue)
            
            captureSession.addOutput(videoBuffer)
            captureSession.addOutput(audioBuffer)
            
            captureSession.startRunning()
            
        }  catch let e {
            print("Error creating capture session: \(e)")
            return
        }
    }

}

extension ConsumptiveMedia : AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        print("hi")
    }
}


