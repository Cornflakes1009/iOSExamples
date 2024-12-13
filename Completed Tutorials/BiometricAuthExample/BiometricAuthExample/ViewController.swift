//
//  ViewController.swift
//  BiometricAuthExample
//
//  Created by Harold Davidson on 12/8/24.
//

import LocalAuthentication
import UIKit

// ❤️❤️❤️❤️❤️❤️❤️❤️ MAKE SURE TO ADD PRIVACY FACEID USAGE DESCRIPTION TO INFO.PLIST ❤️❤️❤️❤️❤️❤️❤️❤️

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.setTitle("Authorize", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(nil, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        let context = LAContext()
        var error: NSError? = nil
        let reason = "Please authorize with TouchID"
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, error in
                DispatchQueue.main.async {
                    if success {
                        let vc = UIViewController()
                        vc.view.backgroundColor = .systemMint
                        self?.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
                    } else {
                        // Authentication failed
                        self?.showAlertForFaceNotRecognized()
                     }
                }
            }
        } else {
            // can't use face/touch id
            let alert = UIAlertController(title: "Unavailable", message: "You can't use this feature", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            
        }
    }
    
    func showAlertForFaceNotRecognized() {
        let alert = UIAlertController(
            title: "Face Not Recognized",
            message: "The face does not match your registered Face ID. Please try again or use your passcode.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        alert.addAction(UIAlertAction(title: "Use Passcode", style: .default, handler: { _ in
            // Handle fallback to passcode
        }))
        present(alert, animated: true)
    }
}

