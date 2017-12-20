//
//  WBNetworkManager.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/20.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit
import AFNetworking //否则AFHTTPSessionManager会报错

/// 网络管理工具
class WBNetworkManager: AFHTTPSessionManager {
    /// swift单例的写法(静态区/常量)
    // 理解为, 在第一次访问时, 执行闭包, 并且将结果保存在shared商量中.
    static let shared = WBNetworkManager()
}
