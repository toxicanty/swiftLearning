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
    
    /// 访问令牌, 所有的网络请求都基于此令牌(登录除外)
    var accessToken:String? = "2.00PHMqeGabEFaE0d8e7bcc84SM3F9D"
    
    
    /// 专门负责拼接token的网络请求方法
    func tokenRequest(method: WBHTTPMethod = .GET, urlString: String, parameters:[String: Any]?,completion: @escaping (_ json: Any?,_ isSuccess: Bool)->()){
        // 1221 9:45
        // 0> 判断token是否为nil,nil就返回
        guard let token = accessToken else{
            // FIXME: token过期的通知
            completion(nil,false)
            return
        }
        // 1> 判断字典是否存在
        var parameters = parameters
        if parameters == nil {
            // 实例化
            parameters = [String:Any]()//括号表示实例化
        }
        
        // 2> 设置参数字典(一定有值, 所以可以强行解包)
        parameters!["access_token"] = token
        
        // 调用request(这里的parameters就是回调获取的json字符串)
        request(urlString: urlString, parameters: parameters, completion: completion)
    }
    
    // 封装get和post两种不同的请求, 定义枚举类型区分
    // 注意对比post和get参数类型差异, 故选用可选类型.
    func request(method: WBHTTPMethod = .GET, urlString: String, parameters:[String: Any]?,completion: @escaping (_ json: Any?,_ isSuccess: Bool)->()){// Function types cannot have argument labels;
        
        // 成功闭包
        let successCallback = {(task: URLSessionDataTask, json:Any?)->() in
            completion(json, true)
        }
        
        // 失败闭包
        let failureCallback = {(task: URLSessionDataTask?, error: Error)->() in
            
            // 针对403处理用户token过期
            if(task?.response as? HTTPURLResponse)?.statusCode == 403 {
                 print("token过期了")
                
                // FIXME: 发送通知(谁收到通知,谁处理)
            }
            
            completion(nil, false)
        }

        if method == .GET {//get
            get(urlString, parameters: parameters, progress: nil, success: successCallback, failure: failureCallback)
        }else{//post
            post(urlString, parameters: parameters, progress: nil, success: successCallback, failure: failureCallback)
        }
    }
}
