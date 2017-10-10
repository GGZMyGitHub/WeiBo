//
//  AppDelegate.swift
//  WeiBo
//
//  Created by guGuangZhou on 2017/7/11.
//  Copyright © 2017年 guGuangZhou. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.backgroundColor = UIColor.cz_random()
        
        window?.rootViewController = GZMainViewController()
        window?.makeKeyAndVisible()

        return true
    }


}

