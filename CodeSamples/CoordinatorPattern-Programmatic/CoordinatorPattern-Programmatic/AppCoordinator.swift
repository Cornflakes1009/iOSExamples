//
//  AppCoordinator.swift
//  CoordinatorPattern-Programmatic
//
//  Created by Harold Davidson on 7/21/25.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        print("AppCoordinator started")
        let vc = HomeViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

    // Example navigation
    func showDetail() {
        let detailVC = DetailViewController()
        navigationController.pushViewController(detailVC, animated: true)
    }
}

