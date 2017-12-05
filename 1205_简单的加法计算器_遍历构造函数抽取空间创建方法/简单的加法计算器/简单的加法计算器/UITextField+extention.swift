//
//  UITextField+extention.swift
//  简单的加法计算器
//
//  Created by toxicanty on 2017/12/5.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

// 注意改成UIKit
import UIKit

extension UITextField{
    /// extension:类似OC分类
    convenience init(frame:CGRect,placeholder:String,fontsize:CGFloat){
        
        // 实力化当前对象
        self.init(frame:frame)//本身有带frame的构造方法,所以不奇怪
        // 访问属性
        self.borderStyle = .roundedRect
        self.placeholder = "0"
        self.font = UIFont.systemFont(ofSize: fontsize)
        self.textAlignment = .center
    }
}
