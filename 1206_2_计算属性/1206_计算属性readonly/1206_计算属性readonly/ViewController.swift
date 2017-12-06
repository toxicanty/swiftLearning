//
//  ViewController.swift
//  1206_计算属性readonly
//
//  Created by toxicanty on 2017/12/6.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p = Person()
        p.name = "laofeng"//调用setter方法,
        print(p.name as Any)//调用getter方法
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

