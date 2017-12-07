//
//  AppDelegate.swift
//  reactionTestDemo
//
//  Created by toxicanty on 2017/12/7.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // 1. 实例化window
        window = UIWindow()
        window?.backgroundColor = UIColor.red//swift3.0是.white()
        
        //2. 设置根控制器
        //        let vc = ViewController()
        //改成反射方式(设置根控制器,需要添加命名空间,默认就是项目名称,最好不要有数字和特殊符号)
        //let clsName = "reactionTestDemo.ViewController"
        // 优化, 这里改成从info.plist获取
        // 1208 输出info.plist
        print(Bundle.main.infoDictionary ?? "没有值")//swift3.0是main()
        let ns = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        //String ?? 不能写成 String?? 会报错
        let clsName = ns + "." + "ViewController"//字符串拼接
        print("clsName === \(clsName)")
        //NSClassFromString(clsName) 是AnyClass类
        let cls = NSClassFromString(clsName) as? UIViewController.Type//记住就好了
        let vc = cls?.init()
        window?.rootViewController = vc
        
        //3. 让window可见
        window?.makeKeyAndVisible()
       
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

