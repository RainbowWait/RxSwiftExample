//
//  AppDelegate.swift
//  RxSwiftExample
//
//  Created by 郑小燕 on 2018/6/5.
//  Copyright © 2018年 郑小燕. All rights reserved.
//

import UIKit

struct InitContent {
    var vc: UIViewController
    let title: String
    let selectedImage: String
    let normalImage: String
}
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var dataArray: [InitContent] = [InitContent(vc: ViewController(), title: "首页", selectedImage: "home-2", normalImage: "home-2"), InitContent(vc: SecondViewController(), title: "中心", selectedImage: "shopping bag-2", normalImage: "shopping bag"), InitContent(vc: ThreeViewController(), title: "个人", selectedImage: "profile-2", normalImage: "profile")]
    var vcArray: [UIViewController] = [UIViewController]()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        for model in dataArray {
            let navi = UINavigationController(rootViewController: model.vc)
            let item = UITabBarItem(title: model.title, image: UIImage(named: model.normalImage), selectedImage: UIImage(named: model.selectedImage))
            navi.tabBarItem = item
            vcArray.append(navi)
        }
        let tabbar = UITabBarController()
        tabbar.tabBarItem.selectedImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        tabbar.viewControllers = vcArray
        self.window?.rootViewController = tabbar
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

