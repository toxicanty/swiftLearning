//
//  AppDelegate.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/7.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //sleep(2)
        window = UIWindow()
        window?.backgroundColor = UIColor.black
        window?.rootViewController = WBMainViewController()

        window?.makeKeyAndVisible()
        
        // 模拟从服务器加载数据
        loadAppInfo()
        return true
    }
    
    private func loadAppInfo(){
        // 1. 模拟异步加载
        DispatchQueue.global().async {
            //1> 弄假的,用url代替, Swift3.0中, Bundle.main().urlForResource("abc",withExtension:nil)
            let url = Bundle.main.url(forResource: "demo.json", withExtension: nil)
            //2> 取到data
            let data = NSData(contentsOf: url!)
            //3> 写入沙盒
            let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]//取0不用解包
            // 注意, 如果swift中没有的方法, 转化成nsstring找到,转到OC的方法去找, 就一定找得到.
            let jsonPath = (docDir as NSString).appendingPathComponent("demo.json")
            
            let isExist = FileManager.default.fileExists(atPath: jsonPath)
            if isExist == false{
                    data?.write(toFile: jsonPath, atomically: true)
                print("沙盒没有该文件, 新创建")
            }else{
                // 即便文件内容变化,只要文件路径不变,都不会再创建.
                print("沙盒中已经有个该文件....")
            }
            
        }
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

