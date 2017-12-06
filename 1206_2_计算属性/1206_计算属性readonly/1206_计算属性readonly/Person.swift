//
//  Person.swift
//  1206_计算属性readonly
//
//  Created by toxicanty on 2017/12/6.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    private  var _name:String?
    
    // swift 中一般不会重写setter和getter方法
    // getter & setter 仅仅演示,日常开发不用!
    var name:String?{
        get{
            // 返回 _成员变量
            return _name
        }
        set{
            // 使用 _成员变量 记录值
            _name = newValue
        }
    }
    
    var title:String{ //不能加private在前面,否则控制器获取不到
        get{// 只写get表示只读属性
          return "Mr. " + (name ?? "")
        }
    }
    
    var number:String{
            return "number = " + (name ?? "")
    }
}
