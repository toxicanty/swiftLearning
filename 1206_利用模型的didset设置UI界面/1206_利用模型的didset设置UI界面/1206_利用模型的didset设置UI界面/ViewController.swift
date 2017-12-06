//
//  ViewController.swift
//  1206_利用模型的didset设置UI界面
//
//  Created by toxicanty on 2017/12/6.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p = Person()
        p.name = "toxicanty"
        
        let label = DemoLabel(frame: CGRect(x: 20, y: 40, width: 100, height: 40))
        
        view.addSubview(label)
        
        // 将模型设置给label
        label.person = p
    }
}

