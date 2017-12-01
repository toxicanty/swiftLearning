//
//  Person.swift
//  1201-load class list at runtime
//
//  Created by toxicanty on 2017/12/1.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class Person: NSObject {
    // mark: swift4.0 必须加@objc关键字
    //苹果在Swift 4 中苹果修改了自动添加 @objc 的逻辑：一个继承 NSObject 的 swift 类不再默认给所有函数添加 @objc。只在实现 OC 接口和重写 OC 方法时才自动给函数添加 @objc 标识。
   @objc var name: String?
    // 这里不可以写成Optional,如果是Optional,就获取不到,而且kvc会崩溃
   @objc var age:Int = 0
    // 同样, 不能在前面用@private
   @objc var title:String?
    
    // 目标:[使用运行时]获取当前累的所有属性的数组
    class func propertyList() -> [String]{
        
        var count: UInt32 = 0
    
        //1. 获取类的属性列表, 返回属性列表的数组, 可选项
        //class_copyPropertyList(self, UnsafeMutablePointer<UInt32>?)//可变的UInt32类型的指针
      let list = class_copyPropertyList(self, &count)
        print("属性的数量 = \(count)")
        
        /*****************************************************************/
//        for i in 0..<Int(count){
//
//            //3. 根据下表获取属性
//            let pty = list?[i]//从可选的数组中提取下标对应的结果,可能为nil
//
//            //4. 获取属性名称的c语言字符串
//            // Int8 -> Byte -> Char = c语言字符串
//         let cName = property_getName(pty!)//swift3.0中是<Int8>?,Swift4.0中是<Int8>, 类型变化了.
//            // 需要用属性获取名称, 属性必须存在, 用了强行解包.
//            print("1==\(cName)")
//
//            //5. 转换成String的字符串
//            let name = String(utf8String: cName)
//            // mark:括号中可以使用name as Any, 打印结果类似:Optional("title")
//            //print(name as Any)
//            print(name!)
//        }
         /*****************************************************************/
        
        // 改写:
        
        for i in 0..<Int(count){
            
            guard let pty = list?[i]//swift4.0对3.0,let不可以去掉
                else{
                    continue
            }
            
            let cName = property_getName(pty)
            
            guard let name = String(utf8String: cName)//swift4.0对3.0,let不可以去掉
                else{
                    continue
            }
            
            print("2==\(cName)")
            
            //let name = String(utf8String: cName)
            print(name)
        }
        // 释放c语言的对象
        free(list)
        return [] //注意:空数组并不是nil
    }
    
}
