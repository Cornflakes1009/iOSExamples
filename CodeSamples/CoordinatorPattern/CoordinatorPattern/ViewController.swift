//
//  ViewController.swift
//  CoordinatorPattern
//
//  Created by Harold Davidson on 7/20/25.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad – coordinator is \(String(describing: coordinator))")
    }

    @IBAction func buyTapped(_ sender: Any) {
        coordinator?.buySubscription()
    }
    @IBAction func createAccountTapped(_ sender: Any) {
        coordinator?.createAccount()
    }
    
}

