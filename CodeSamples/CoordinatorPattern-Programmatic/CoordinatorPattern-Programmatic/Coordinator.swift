//
//  Coordinator.swift
//  CoordinatorPattern-Programmatic
//
//  Created by Harold Davidson on 7/21/25.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
