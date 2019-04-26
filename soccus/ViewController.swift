//
//  ViewController.swift
//  soccus
//
//  Created by Truman Purnell on 4/19/19.
//  Copyright © 2019 Truman Purnell. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var generative: GenerativeMedia = GenerativeMedia()
    var consumptive: ConsumptiveMedia = ConsumptiveMedia()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        var sineWave: [Float32] = [Float32](repeating: 0, count: 150_000)
        
        for i in 0..<150_000 {
            sineWave[i] = sin(Float(i * 440))
        }

        self.generative.generateAudio(audioData: sineWave)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    
    
}

