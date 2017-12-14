//
//  WBBaseViewController.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/7.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 基本界面设置
        setupUI()
    }
    
    
   func setupUI(){
        view.backgroundColor = UIColor.yw_random()
    
        
    }
}


