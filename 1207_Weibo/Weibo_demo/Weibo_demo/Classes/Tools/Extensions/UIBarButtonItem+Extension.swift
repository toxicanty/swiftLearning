//
//  UIBarButtonItem+Extension.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/14.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    /// fyz navBarItem便利构造函数
    ///
    /// - Parameters:
    ///   - title: 按钮文字
    ///   - fontSize: 文字大小
    ///   - target: 目标
    ///   - action: 方法
    convenience init(title:String, fontSize:CGFloat = 16, target:Any?, action:Selector){
        
        let btn: UIButton = UIButton.yw_textButton(title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        //btn.addTarget(self, action: #selector(showFriend), for: UIControlEvents.touchUpInside)
        //navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        
        // 实例化UIBarButtonItem
        self.init(customView: btn)
    }
    
}
