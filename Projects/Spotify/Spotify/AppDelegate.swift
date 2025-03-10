//
//  AppDelegate.swift
//  Spotify
//
//  Created by Harold Davidson on 9/25/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .spotifyBlack
        window?.makeKeyAndVisible()
        
        //let navigatorController = UINavigationController(rootViewController: TitleBarController())
        let navigatorController = UINavigationController(rootViewController: RootViewController())
        window?.rootViewController = navigatorController
        
        //window?.rootViewController = HomeController()
        
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .spotifyBlack
        
        return true
    }
}

