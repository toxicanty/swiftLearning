//
//  WBNetworkManager+Extension.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/20.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import Foundation

extension WBNetworkManager {
    
    // 现在的目标是, 简化网络请求的过程, 直接返回给用户,微博的数组, 不要返回json再处理, 显得不够直观.
    // 相比swift3.0,swift4.0中,
    // 1. 注意逃逸闭包 2,作为类型不可携带形参名
    func statusList(completion:@escaping (_:[[String:Any]]?, _:Bool)->()){
        
        let URLString = "https://api.weibo.com/2/statuses/home_timeline.json"
        let params = ["access_token":"2.00PHMqeGabEFaE0d8e7bcc84SM3F9D"]
        
        request(urlString: URLString, parameters: params) { (json, isSuccess) in
            let result = (json as! NSDictionary)["statuses"] as? [[String:Any]]
            
            completion(result, isSuccess)
        }
    }
}
