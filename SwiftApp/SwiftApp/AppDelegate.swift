//
//  AppDelegate.swift
//  SwiftApp
//
//  Created by quhong1v1 on 2022/3/11.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // 多个 window：
    // 第 1 个用于主app；
    // 第 2 个用于显示广告页；
    var windows: [UIWindow]?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        Thread.sleep(forTimeInterval: 3) //延长启动页时间
        
        /* 单window （切换rootViewController）
        window = UIWindow.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        window?.backgroundColor = .white
        window?.rootViewController = AdvertiseViewController()
        window?.makeKeyAndVisible()
         */
        
        
        // 后一个 window 盖在前一个之上，可以通过：
        // windows?[下标].makeKeyAndVisible() 来切换显示
        // 多window 主视图控制器 和 广告视图 不共用同一个window
        windows = [
            addWindowWithVC(ZATabBarController()),
            addWindowWithVC(AdvertiseViewController())
        ]
        return true
    }
    
    func addWindowWithVC(_ vc: UIViewController) -> UIWindow {
        let window = UIWindow.init(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.rootViewController = vc
        window.makeKeyAndVisible()
        return window
    }

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

