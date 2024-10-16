//
//  GiftVC.swift
//  Starbucks
//
//  Created by Harold Davidson on 10/15/24.
//

import UIKit

class GiftVC: StarbucksVC {
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
        title = "Gift"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "gift.fill", title: "Gift")
    }
}
