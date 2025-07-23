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

        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func goToDetail() {
        coordinator?.showDetail()
    }
}

