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
        
        let homeVC = HomeVC()
        let scanVC = UINavigationController(rootViewController: ScanVC())
        let giftVC = UINavigationController(rootViewController: GiftVC())
        let orderVC = UINavigationController(rootViewController: OrderVC())
        let storeVC = UINavigationController(rootViewController: StoreVC())
        
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeVC, scanVC, giftVC, orderVC, storeVC]
        window?.rootViewController = tabBarController
        
        tabBarController.tabBar.tintColor = .lightGreen
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.backgroundColor = .black
        return true
    }
    
//    func makeNavigationController(rootViewController: UIViewController) -> UINavigationController {
//        let navigationController = UINavigationController(rootViewController: rootViewController)
//        navigationController.navigationBar.prefersLargeTitles = true
//        
//        let attrs = [
//            NSAttributedString.Key.foregroundColor: UIColor.label,
//            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .title1).bold()
//        ]
//        
//        navigationController.navigationBar.largeTitleTextAttributes = attrs
//        
//        return navigationController
//    }
}
