//
//  ViewController.swift
//  soccus
//
//  Created by Truman Purnell on 4/19/19.
//  Copyright © 2019 Truman Purnell. All rights reserved.
//

import UIKit
import AVFoundation
import CoreBluetooth



class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    var peripheral: CBPeripheral?
    var centralManager: CBCentralManager?

    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            self.centralManager?.scanForPeripherals(withServices:nil)
        }
    }
    
    func centralManager(_ central: CBCentralManager,
                        didDiscover peripheral: CBPeripheral,
                        advertisementData: [String : Any],
                        rssi RSSI: NSNumber) {
        
        if peripheral.name == "CC2650 SensorTag" {
            self.peripheral = peripheral
            self.peripheral?.delegate = self
            
            self.centralManager?.stopScan()
            self.centralManager?.connect(self.peripheral!)
        }
        
    }
    
    func centralManager(_ central: CBCentralManager,
                        didConnect peripheral: CBPeripheral) {
        print(self.peripheral)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    
    
}

