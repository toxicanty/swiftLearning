//
//  UIbutton+extention.swift
//  简单的加法计算器
//
//  Created by toxicanty on 2017/12/5.
//  Copyright © 2017年 toxicanty. All rights reserved.
//  warning: 这里我故意把类名和extension写错, 观察是否影响分类创建

//import Foundation
import UIKit

extension UIButton {
    
    /// 自定义button构造方法
    convenience init(title:String,color:UIColor = UIColor.darkGray,fontSize:CGFloat){
        
        self.init()
        self.setTitle(title, for: UIControlState.normal)
        self.backgroundColor = color
        self.setTitleColor(UIColor.green, for: UIControlState.normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        self.sizeToFit()
    }
    
}
