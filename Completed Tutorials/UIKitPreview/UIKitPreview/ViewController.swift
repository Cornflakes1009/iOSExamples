//
//  ViewController.swift
//  UIKitPreview
//
//  Created by Harold Davidson on 12/13/24.
//


import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.center = view.center
        view.addSubview(button)
    }
}

import SwiftUI

struct ViewControllerPreview: UIViewControllerRepresentable {
  
  var viewControllerBuilder: () -> UIViewController
  
  init(_ viewControllerBuilder: @escaping () -> UIViewController) {
    self.viewControllerBuilder = viewControllerBuilder
  }
  
  func makeUIViewController(context: Context) -> some UIViewController {
    viewControllerBuilder()
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
   // Nothing to do here
  }
 
}

struct ProductViewController_Previews: PreviewProvider {
  static var previews: some View {
    ViewControllerPreview {
      ViewController()
    }
  }
}
