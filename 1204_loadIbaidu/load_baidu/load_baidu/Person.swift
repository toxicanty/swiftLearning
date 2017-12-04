//
//  Person.swift
//  load_baidu
//
//  Created by toxicanty on 2017/12/4.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name: String?
    var age :Int = 0
    
    //遍历构造函数:  swift2.0,和4.0必须加convenience关键字
    convenience init?(name:String, age:Int){
        
        if age > 100{
            return nil
        }
        //self.name = name 这句不可以放到self.init()之前
        // 实例化当前对象
        self.init()
        
        self.name = name
    }

}
