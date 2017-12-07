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
    
    // 改进
    var namespace:String{
        let bundleName = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        let full = bundleName + "." + "ViewController"
        return full
        //return  (Bundle.main.infoDictionary?["CFBundleName"] as? String ?? "" + "." + "ViewController")
        }
    
}

