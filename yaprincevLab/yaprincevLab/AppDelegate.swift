//
//  AppDelegate.swift
//  yaprincevLab
//
//  Created by Максим Япринцев on 03.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewcontroller = MainViewController()
        let navi = UINavigationController(rootViewController: viewcontroller)
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        
        return true
    }

    
}

