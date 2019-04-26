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
    
    var sensoryMedia: SensoryMedia = SensoryMedia()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sensoryMedia.capture()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    
    
}

