//
//  WBStatus.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/21.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit
import YYModel

class WBStatus: NSObject {

    // Int类型,在64位机器是64位,在32位机器上是32位.(ipd2,iphone5以下的机器,会有问题)
    var id : Int64 = 0
    /// 微博信息内容
    var text: String?
    
    // 重写description的计算型属性
    override var description: String{
        
        return yy_modelDescription()
    }
}
