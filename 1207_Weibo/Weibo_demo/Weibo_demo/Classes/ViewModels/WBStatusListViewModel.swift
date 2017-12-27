//
//  WBStatusListViewModel.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/21.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import Foundation

/// 微博数据列表视图模型

/*
 父类的选择
 -  如果类需要使用kvc后者字典转模型, 就需要继承NSObject
 - 如果只是包装一些代码逻辑, 即一些函数处理, 可以不用任何父类, 更加轻量级
 (OC一律都继承NSObject)
 */

/// 上啦刷新最大尝试册数
private let maxPullupTryTimes = 3

class WBStatusListViewModel : NSObject{
    
    // 微博模型数组,懒加载
    lazy var statusList = [WBStatus]()
    
    // 上啦刷新错误次数
    private var pullupErrorTimes = 0
    
    // 1. 闭包逃逸  2. 类型中_这里不可以写形参
    func loadStatus(pullup:Bool, completion:@escaping (_ isSuccess:Bool, _ shouldRefresh:Bool)->()){
        
        // 判断是否是上拉刷新, 检查刷新错误
        if pullup && pullupErrorTimes > maxPullupTryTimes {
            completion(true,false)
            return
        }
        
        //1227  从某一条开始加载(数组第一条)
        let since_id = pullup ? 0 : (statusList.first?.id ?? 0)
        let max_id = !pullup ? 0 : (statusList.last?.id ?? 0)
        
        WBNetworkManager.shared.statusList(since_id: since_id,max_id: max_id) { (list,isSuccess) in
            
            //1, 字典转模型
            // 类型名.self 指的是类型本身，返回 AnyClass 对象
            //let array = NSArray.yy_modelArray(with: WBStatus.self, json: list ?? []) as? [WBStatus]
        
            print(list ?? "abccccccccccccc")
            
            /*
             guard  let array = try? JSONSerialization.jsonObject(with: list,
             options: .allowFragments) as? [[String: AnyObject]]else{
             
             let jsonData = list.data(encoding: .utf8)!
             let decoder = JSONDecoder()
             guard let array = try? decoder.decode(WBStatus.self, from: <#T##Data#>)
             */
//            let decoder = JSONDecoder()
//            let jsonData = try? JSONSerialization.data(withJSONObject: list, options: JSONSerialization.WritingOptions.prettyPrinted)
//            guard let array = try? decoder.decode(WBStatus.self, from: jsonData!) else{
//            guard  let array = NSArray.yy_modelArray(with: WBStatus.self, json: list!) as? [WBStatus] else{//先强转类型,最好给一个空数组
//                return
//            }
            let array = self.handleDicArray2ModelArray(dicArray: list)
            // 2. 拼接数据
            if pullup{//上拉刷新
                self.statusList += array
            }else{
                // 下拉刷新应该讲结果数组拼接在数组前面
                self.statusList = array + self.statusList //有点巧妙
            }
            
            if pullup && array.count == 0 {
                self.pullupErrorTimes += 1//从swift3.0开始就没有++操作了
                //1227 不调用了.
                completion(isSuccess,false)
            }else{
                // 3. 完成回调(正常调用)
                completion(isSuccess,true)
            }
            
        }
    }
    
    // yymodel转换不管用, 自己先测试搞个方法替代
    func handleDicArray2ModelArray(dicArray: [[String : Any]]?)->([WBStatus]){
        
        var satusArr = [WBStatus]()
        
        for dic in dicArray!{
          let status = WBStatus()
            status.text = dic["text"] as? String
            status.id = (dic["id"] as? Int64) ?? 0
            satusArr.append(status)
        }
        return satusArr
    }
}
