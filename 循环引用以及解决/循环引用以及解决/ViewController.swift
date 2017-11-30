//
//  ViewController.swift
//  循环引用以及解决
//
//  Created by toxicanty on 2017/11/30.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 声明变量
    var cpCompletion :(()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // method 1: Objective-C way
        /*
        weak var weakSelf = self
        // Do any additional setup after loading the view, typically from a nib.
        loadData {
            // if you call like this,deinit with not called
           //print(self.view)
            // 0这个值是瞎传的,默认值
            print(weakSelf?.view ?? 0)//Optional type
        }
        */
        // method 2:recommend by swift office
        loadData {
            [weak self] in
            print(self?.view ?? 0)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit {
        print("I die")
    }
    
    func loadData(completion:@escaping ()->()) -> () {
        // 赋值给属性
        cpCompletion = completion
        
        DispatchQueue.global().async {
            completion()//
        }
    }

}

