//
//  ViewController.swift
//  Dif_betweenOCandSwift
//
//  Created by toxicanty on 2017/12/6.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var label:UILabel? = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(label as Any)//打印label的地址
        
        label?.text = "hello"
        label?.sizeToFit()
        
        print(label as Any)//打印label的地址
        
        label = nil
        //注意这里跟OC不相同,如果这里置空,后面打印就为nil,OC中可以再重新创建.
        // 产生这种差异的原因是创建原理不同,OC是为nil就去实例化;Swift是第一次调用执行闭包,将闭包的结果保存在label的属性中.
        
        print(label as Any)//打印为nil
    }
}

