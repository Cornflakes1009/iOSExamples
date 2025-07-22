//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by Harold Davidson on 7/20/25.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController? { get set }
    
    func start()
}
