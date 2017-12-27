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
    func statusList(since_id:Int64 = 0,max_id:Int64 = 0, completion:@escaping (_:[[String:Any]]?, _:Bool)->()){
        
        let URLString = "https://api.weibo.com/2/statuses/home_timeline.json"
        
        // swift3.0中,必须要转换格式才能把Int64转变成AnyObject
        // 但Swift4.0中, 好像只需"since_id":"since_id"就可以直接作为Any类型使用,不需转化
        let params = ["since_id":"\(since_id)",
            "max_id":"\(max_id > 0 ? max_id - 1 : 0)"]
        
        // 1221 改成获取了token的请求方法
        tokenRequest(urlString: URLString, parameters: params) { (json, isSuccess) in
            let result = (json as! NSDictionary)["statuses"] as? [[String:Any]]
        
            completion(result, isSuccess)
        }
    }
    
    
    }


// 还是网络相关的, 所以在这里处理
extension WBNetworkManager {
    
    // 加载accessToken
    func loadAccessToken(code:String){
        
        let urlString = "https://api.weibo.com/oauth2/access_token"
        let param = ["client_id" : WBAPPKey,
                     "client_secret" : WBAPPSecret,
                     "grant_type" : "authorization_code",
                     "code" : code,
                     "redirect_uri":WBRedirectURI
        ]
        
        // 发起网络骑牛
        request(method: .POST, urlString: urlString, parameters: param) { (json, isSuccess) in
            
            print("发起网络骑牛 === \(json)")
        }
        
        
    }
}
