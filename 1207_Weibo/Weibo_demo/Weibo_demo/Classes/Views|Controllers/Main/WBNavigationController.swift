//
//  WBNavigationController.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/7.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class WBNavigationController: UINavigationController {
 
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if(childViewControllers.count > 0){
            
           viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }
}


