//
//  AppDelegate.swift
//  NYTDemo
//
//  Created by Harold Davidson on 4/22/25.
//

import UIKit

// 1. Delete Main Storyboard
// 2. Project > Info > delete Scene Manifest
// 3. Add the code below

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        let vc = ViewController()
        vc.view.backgroundColor = .red
        window.rootViewController = vc
        self.window = window
        window.makeKeyAndVisible()

        return true
    }
}
