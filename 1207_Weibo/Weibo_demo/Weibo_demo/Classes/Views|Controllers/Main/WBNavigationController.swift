//
//  WBNavigationController.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/7.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class WBNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        
        // 隐藏系统的navigationBar
        navigationBar.isHidden = true //一种方法...不能push了,整个上面都没有了.
    }
 
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if(childViewControllers.count > 0){
            
           viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }
}


