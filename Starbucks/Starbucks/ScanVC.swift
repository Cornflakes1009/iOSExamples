//
//  ScanVC.swift
//  Starbucks
//
//  Created by Harold Davidson on 10/15/24.
//

import UIKit

class ScanVC: StarbucksVC {
    override func viewDidLoad() {
        view.backgroundColor = .systemIndigo
        title = "Scan"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "qrcode", title: "Scan")
    }
}
