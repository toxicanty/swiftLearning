//
//  Bundle+extension.swift
//  reactionTestDemo
//
//  Created by toxicanty on 2017/12/7.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import Foundation

extension Bundle{
    
    // 先写成函数样式, 无参数,返回值为字符串
//    func namespace() -> String{
//        return  Bundle.main.infoDictionary?["CFBundleName"] as? String ?? "" + "." + "ViewController"//字符串拼接
//    }
    
    var namespace:ViewController{
        let bundleName = infoDictionary?["CFBundleName"] as? String ?? ""
        let full = bundleName + "." + "ViewController"
        
        let cls = NSClassFromString(full) as? ViewController.Type//记住就好了
        
        // 使用类创建控制器
        guard let vc = cls?.init() else{
            return ViewController()//这么写不知道合不合理
        }
        return vc
        }
}

