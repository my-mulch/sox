//
//  GenerativeMedia.swift
//  soccus
//
//  Created by Truman Purnell on 4/25/19.
//  Copyright © 2019 Truman Purnell. All rights reserved.
//

import AVFoundation

class GenerativeMedia : NSObject {
    
    let samples: AVAudioFrameCount
    let audioEngine: AVAudioEngine
    let audioGenerator: AVAudioPlayerNode
    let audioQueue: DispatchQueue
    let audioFormat: AVAudioFormat?
    let audioBuffer: AVAudioPCMBuffer?
    
    override init() {
        self.samples = 150_000
        self.audioEngine = AVAudioEngine()
        self.audioGenerator = AVAudioPlayerNode()
        self.audioQueue = DispatchQueue.global(qos: .userInteractive)
        self.audioFormat = AVAudioFormat(standardFormatWithSampleRate: 44100.0, channels: 1)
        self.audioBuffer = AVAudioPCMBuffer(pcmFormat: self.audioFormat!, frameCapacity: self.samples)
        
        self.audioEngine.attach(self.audioGenerator)
        self.audioEngine.connect(self.audioGenerator,
                                 to: self.audioEngine.mainMixerNode,
                                 format: self.audioFormat)
        
        do { try self.audioEngine.start() } catch { return }
    }
    
    public func generateAudio(audioData: [Float32]){
        
        let channel = self.audioBuffer?.floatChannelData?[0]
        

        for i in 0..<audioData.count {
            channel?[i] = audioData[i]
        }
        
        self.audioBuffer?.frameLength = self.samples
        
        self.audioGenerator.scheduleBuffer(self.audioBuffer!)
        self.audioGenerator.play()
        
    }
}
