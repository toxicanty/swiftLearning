//
//  WBBaseViewController.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/7.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {
    
    // 自定义导航条
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.yw_screenWidth(), height: 64))

    // 自定义导航条目
    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 基本界面设置
        setupUI()
    }
    
    override var title: String?{
        didSet{
            navItem.title = title
        }
    }
    
   func setupUI(){
        view.backgroundColor = UIColor.yw_random()
    
        // 添加导航条
    view.addSubview(navigationBar)
    navigationBar.items = [navItem]
    }
}

