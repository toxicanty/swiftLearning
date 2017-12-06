//
//  DemoLabel.swift
//  1206_利用模型的didset设置UI界面
//
//  Created by toxicanty on 2017/12/6.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class DemoLabel: UILabel {

    // 模型 -> 给视图设置person模型,由视图自己根据模型的数据, 决定显示内容
    var person:Person?{ // 注意这个{不是闭包,别混淆了
        didSet {// 注意,xcode没有提示
            // 与OC的区别, 不需要再考虑, _成员变量 = 值
            // OC是copy属性, 应该写, _成员变量 = 值.copy
            text = person?.name
        }
    }
}
