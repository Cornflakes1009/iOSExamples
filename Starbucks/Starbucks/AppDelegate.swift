//
//  AppDelegate.swift
//  Starbucks
//
//  Created by Harold Davidson on 10/14/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let homeVC = makeNavigationController(rootViewController: HomeVC())
        let scanVC = makeNavigationController(rootViewController: ScanVC())
        let giftVC = makeNavigationController(rootViewController: GiftVC())
        let orderVC = makeNavigationController(rootViewController: OrderVC())
        let storeVC = makeNavigationController(rootViewController: StoreVC())
        
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeVC, scanVC, giftVC, orderVC, storeVC]
        window?.rootViewController = tabBarController
        return true
    }
    
    func makeNavigationController(rootViewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.label,
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .title1).bold()
        ]
        
        navigationController.navigationBar.largeTitleTextAttributes = attrs
        
        return navigationController
    }
}
