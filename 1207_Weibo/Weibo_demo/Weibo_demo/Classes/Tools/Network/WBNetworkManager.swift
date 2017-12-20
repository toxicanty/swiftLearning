//
//  WBNetworkManager.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/20.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit
import AFNetworking //否则AFHTTPSessionManager会报错

// swift 枚举支持任何类型
enum WBHTTPMethod {
    
    case GET
    case POST
}

/// 网络管理工具
class WBNetworkManager: AFHTTPSessionManager {
    /// swift单例的写法(静态区/常量)
    // 理解为, 在第一次访问时, 执行闭包, 并且将结果保存在shared商量中.
    static let shared = WBNetworkManager()
    
    
    // 封装get和post两种不同的请求, 定义枚举类型区分
    // 注意对比post和get参数类型差异, 故选用可选类型.
    func request(method: WBHTTPMethod = .GET, urlString: String, parameters:[String: Any]?,completion: @escaping (_ json: Any?,_ isSuccess: Bool)->()){// Function types cannot have argument labels;
        
        // 成功闭包
        let successCallback = {(task: URLSessionDataTask, json:Any?)->() in
            completion(json, true)
        }
        
        // 失败闭包
        let failureCallback = {(task: URLSessionDataTask?, error: Error)->() in
            completion(nil, false)
        }

        if method == .GET {//get
            get(urlString, parameters: parameters, progress: nil, success: successCallback, failure: failureCallback)
        }else{//post
            post(urlString, parameters: parameters, progress: nil, success: successCallback, failure: failureCallback)
        }
    }
}
