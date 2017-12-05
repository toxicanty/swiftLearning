//
//  UiLabel+extent.swift
//  简单的加法计算器
//
//  Created by toxicanty on 2017/12/5.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

extension UILabel{
    /// 自定义label构造方法
    convenience init(frame:CGRect, txt:String){
        self.init(frame:frame)
        self.text = txt
        self.textAlignment = .center
    }
}
