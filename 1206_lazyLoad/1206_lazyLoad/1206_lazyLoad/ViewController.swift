//
//  ViewController.swift
//  1206_lazyLoad
//
//  Created by toxicanty on 2017/12/6.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     //var label:DemoLabel?
    // 进化1:改成一开始就实例化,后面就不需要问号和惊叹号了.
    //var label = DemoLabel()
    
    //进化2: 这种懒加载方式,用到label时候才去实例化, 而且使用时的问号,惊叹号都没有了.
    lazy var label:DemoLabel = DemoLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupUI()
    }

    private func setupUI(){
        
        //1. 创建控件
        label = DemoLabel()
        
        //2. 添加到视图
//        view.addSubview(label!)
//
//        label?.text = "hello"
//        label?.sizeToFit()
//        label?.center = view.center
        
                view.addSubview(label)
        
                label.text = "hello"
                label.sizeToFit()
                label.center = view.center
    }


}

