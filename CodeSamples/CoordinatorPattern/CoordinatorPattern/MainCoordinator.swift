//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by Harold Davidson on 7/20/25.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func buySubscription() {
        let vc = BuyViewController.instantiate()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func createAccount() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
