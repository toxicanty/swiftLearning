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
        navigationBar.isHidden = false //隐藏方式不可用:不能push了,整个上面都没有了
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.darkGray]//改变标题颜色
        
        
    }
 
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if(childViewControllers.count > 0){
            
           viewController.hidesBottomBarWhenPushed = true
        }
        
//        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 49, height: 29))
//        btn.titleLabel?.text = "123"
//        btn.setTitleColor(UIColor.purple, for: UIControlState.normal)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        super.pushViewController(viewController, animated: true)
        
        
    }
}


