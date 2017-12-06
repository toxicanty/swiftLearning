//
//  DemoLabel.swift
//  1206_lazyLoad
//
//  Created by toxicanty on 2017/12/6.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class DemoLabel: UILabel {

    // 重写构造函数(纯代码开发的入口)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()//会发现,如果不用懒加载,直接var label = DemoLabel(),会提前来到这里,再走控制器的viewDidLoad方法
        // 所以, 需要懒加载,延迟加载,减少内存小号
    }
    
    // initWithCode 是使用xib开发的入口
    // 提示:所有UIView及子类在开发时,一旦重写了构造函数,必须要实现initWithCode函数,以保证提供两个通道!
    // xcode智能提示
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        
        // 这句是禁止xib使用本类,这时如果用xib开发,会直接崩溃!
        // 写了这句就不要在xib里拖控件了
        //fatalError("init(coder:) has not been implemented")
    }
    
    
    // 如果想要支持xib和纯代码开发都支持, 就需要在以上两个方法中,分别调用setupUI
    private func setupUI(){
    
    
    }
    
}
