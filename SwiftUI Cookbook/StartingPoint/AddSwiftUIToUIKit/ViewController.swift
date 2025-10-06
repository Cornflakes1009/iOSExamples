//
//  ViewController.swift
//  AddSwiftUIToUIKit
//
//  Created by Edgar Nzokwe on 7/19/21.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBSegueAction func goToSwiftUI(_ coder: NSCoder) -> UIViewController? {
        let greetings = "Hello from UIKit"
        let rootView = Greetings(textFromUIKit: greetings)
        return UIHostingController(coder: coder, rootView: rootView)
    }
    
}
