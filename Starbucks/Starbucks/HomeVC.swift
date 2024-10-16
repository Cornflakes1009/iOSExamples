//
//  HomeVC.swift
//  Starbucks
//
//  Created by Harold Davidson on 10/14/24.
//

import UIKit

class HomeVC: StarbucksVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavBar()
        setTabBarImage(imageName: "house.fill", title: "Home")
    }

    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Good afternoon, Harold ☀️"
    }

}

