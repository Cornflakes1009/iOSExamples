//
//  OrderVC.swift
//  Starbucks
//
//  Created by Harold Davidson on 10/15/24.
//

import UIKit

class OrderVC: StarbucksVC {
    override func viewDidLoad() {
        view.backgroundColor = .systemTeal
        title = "Order"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "arrow.up.bin.fill", title: "Order")
    }
}
