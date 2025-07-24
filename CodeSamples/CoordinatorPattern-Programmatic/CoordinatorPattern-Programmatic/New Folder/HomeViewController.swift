//
//  HomeViewController.swift
//  CoordinatorPattern-Programmatic
//
//  Created by Harold Davidson on 7/21/25.
//

import UIKit

class HomeViewController: UIViewController {
    weak var coordinator: AppCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeViewController loaded")

        view.backgroundColor = .systemBackground
        title = "Home"

        let button = UIButton(type: .system)
        button.setTitle("Go to Detail", for: .normal)
        button.addTarget(self, action: #selector(goToDetail), for: .touchUpInside)
        
        let settingsButton = UIButton(type: .system)
        settingsButton.setTitle("Go to Settings", for: .normal)
        settingsButton.addTarget(self, action: #selector(goToSettings), for: .touchUpInside)

        view.addSubview(button)
        view.addSubview(settingsButton)
        button.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            settingsButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16),
            settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    @objc func goToDetail() {
        coordinator?.showDetail()
    }
    
    @objc func goToSettings() {
        coordinator?.showSettings()
    }
}

