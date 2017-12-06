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
    
    // 进化3: 不建议这么写,但是要认识(swift4已经不支持了,或者变化了)
    // 不建议的原因:1闭包中的智能提示不好,2闭包中如果出现self. 需要注意循环引用
    // 懒加载本质上是闭包,完整写法如下: {}包装的代码, ()执行代码
//    lazy var label = {()->DemoLabel in
//        let  l = DemoLabel()
//        // 这里可以设置label的属性
//        return l
//    }
    
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

