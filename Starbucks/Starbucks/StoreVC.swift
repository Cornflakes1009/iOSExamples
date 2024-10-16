//
//  StoreVC.swift
//  Starbucks
//
//  Created by Harold Davidson on 10/15/24.
//

import UIKit

class StoreVC: StarbucksVC {
    override func viewDidLoad() {
        view.backgroundColor = .systemGray
        title = "Stores"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "location.fill", title: "Stores")
    }
}
